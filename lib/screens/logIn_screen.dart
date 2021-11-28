import 'package:btp_project1/screens/tabScreen.dart';
import 'package:btp_project1/widgets/user_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tile_list.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
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
            SizedBox(height: height*0.06,),
            UserInput(_isLogin),
            Container(
                width: width,
                height: height * 0.06,
                child: RaisedButton(
                  color: Color.fromRGBO(237, 73, 103, 1),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> TabScreen(),));
                    // final _passProvider= Provider.of<ActivityProvider>(context,listen: false);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => ChangeNotifierProvider.value(value: _passProvider,child:TabScreen(),) 
                        
                    //     ),
                    // );
                    //Navigator.of(context).restorablePushReplacement((context, arguments) => null)
                  },
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
                  style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin ? "Sign up" : "Log in",
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17)),
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
