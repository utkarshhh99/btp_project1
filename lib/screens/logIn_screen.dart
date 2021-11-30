import 'package:btp_project1/widgets/user_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool _isLogin = true;
  FirebaseAuth _auth = FirebaseAuth.instance;
  static TextEditingController _emailController = new TextEditingController();
  static TextEditingController _passwordController =
      new TextEditingController();
  static TextEditingController _confirm = new TextEditingController();
  static TextEditingController _userName = new TextEditingController();
  static TextEditingController _phone = new TextEditingController();

  void _makeUser(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });
      if (_isLogin) {
        UserCredential user = await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } else {
        if (_passwordController.text == _confirm.text) {
          UserCredential user = await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
          final url = Uri.parse(
              "https://tracker-deck-default-rtdb.firebaseio.com/users.json");
          final response = await http.post(url,
              body: json.encode({
                'email': _emailController.text,
                'password': _passwordController.text,
                'userName': _userName.text,
                'phone': _phone.text,
                'id': _auth.currentUser.uid,
              }));
        } else {
          /*Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Match the passwords!")));*/
        }
      }
    } on PlatformException catch (err) {
      var message = 'Please check your credentials';
      if (err.message != null) {
        message = err.message;
      }
      /* Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));*/
      setState(() {
        isLoading = false;
      });
    } catch (err) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.14,
            ),
            Text(
              _isLogin ? "WELCOME BACK !" : "WELCOME !",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            UserInput(_isLogin, _emailController, _passwordController, _confirm,
                _userName, _phone),
            Container(
                width: width,
                height: height * 0.06,
                child: RaisedButton(
                  color: Color.fromRGBO(237, 73, 103, 1),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () => _makeUser(context),
                  child: Text(
                    "Confirm",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isLogin ? "Not a member ?" : "Already a member ?",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin ? "Sign up" : "Log in",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                  textColor: Color.fromRGBO(237, 73, 103, 1),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
