import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  Widget _buildField(BuildContext ctx, var h, var w) {
    return Row(
      children: <Widget>[
        Container(
          height: h * 0.08,
          width: w * 0.15,
          alignment: Alignment.bottomCenter,
          child: TextField(
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
                counterText: "",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(237, 73, 103, 1),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromRGBO(237, 73, 103, 1)),
                )),
            cursorColor: Color.fromRGBO(237, 73, 103, 1),
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.black, fontSize: 30),
            cursorHeight: 30,
            onChanged: (_) => FocusScope.of(ctx).nextFocus(),
          ),
        ),
        SizedBox(
          width: 13,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: height * 0.15,
              ),
              height: height * 0.15,
              width: width * 0.45,
              child: Image.asset(
                "assets/img5.PNG",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "Verification",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Text(
              "Enter the otp sent to your phone number to verify your account",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildField(context, height, width),
                _buildField(context, height, width),
                _buildField(context, height, width),
                _buildField(context, height, width),
              ],
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Container(
                width: width,
                height: height * 0.06,
                child: RaisedButton(
                  color: Color.fromRGBO(237, 73, 103, 1),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> TabScreen()));
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Did not receive the OTP ?",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Resend",
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
