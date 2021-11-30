import 'package:flutter/material.dart';


class UserInput extends StatefulWidget {
  bool _isLogin;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirm = new TextEditingController();
  TextEditingController _userName = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  UserInput(this._isLogin,this._emailController,this._passwordController,this._confirm,this._userName,this._phone);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool _isObscurePassword = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          if(!widget._isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
              controller: widget._userName,
              decoration: InputDecoration(
                  hintText: "Username",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
              controller: widget._emailController,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.only(left: width * 0.08 , right: width*0.03),
            child: TextFormField(
              controller: widget._passwordController,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                  hintText: "Password (minimum 6 characters long)",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                    color: Color.fromRGBO(237, 73, 103, 1),
                    onPressed: () {
                      setState(() {
                        _isObscurePassword = !_isObscurePassword;
                      });
                    },
                  ),
              ),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          if(!widget._isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.only(left: width * 0.08 , right: width*0.03),
            child: TextFormField(
              controller: widget._confirm,
              obscureText: _isObscurePassword,
              decoration: InputDecoration(
                  hintText: "Re-enter password",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                  color: Color.fromRGBO(237, 73, 103, 1),
                  onPressed: () {
                    setState(() {
                      _isObscurePassword = !_isObscurePassword;
                    });
                  },
                ),
              ),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          if(!widget._isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.05),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
              controller: widget._phone,
              decoration: InputDecoration(
                  hintText: "Phone number",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
        ],
      ),
    );
  }
}
