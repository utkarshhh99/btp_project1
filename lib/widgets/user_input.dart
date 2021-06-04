import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  bool _isLogin;

  UserInput(this._isLogin);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Username",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          if(!_isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
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
              decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                    color: Color.fromRGBO(237, 73, 103, 1),
                    onPressed: () {
                      },
                  ),
              ),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          if(!_isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.025),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.only(left: width * 0.08 , right: width*0.03),
            child: TextFormField(
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
                  },
                ),
              ),
              cursorColor: Color.fromRGBO(237, 73, 103, 1),
            ),
          ),
          if(!_isLogin)
          Container(
            width: width,
            height: height * 0.065,
            margin: EdgeInsets.only(bottom: height * 0.05),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400],width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: width * 0.08),
            child: TextFormField(
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
