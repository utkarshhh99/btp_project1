import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  var c;
  String user;
  String email;
  String ph;
  SettingsScreen(this.c,this.user,this.email,this.ph);

  Widget _buildContainer(double h , double w , String text){
    return Container(
      height: h*0.06,
      width: w*0.82,
      margin: EdgeInsets.only(bottom: h*0.02,left: w*0.09),
      padding: EdgeInsets.symmetric(horizontal: w*0.05),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromRGBO(237,73,103, 0.16), ),
      child: Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
    );
  }
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //var c = user[0].substring(0,1).toUpperCase();
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color:  Colors.black,
                  ),
                  label: Text(
                    "Back",
                    style: TextStyle(
                        color:  Colors.black),
                  )),
              Row(
                children: [
                  Text(
                    "      Personal Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Color.fromRGBO(237,73,103, 1)),
                  ),
                  //SizedBox(width: width*0.2,),
                  //IconButton(icon: Icon(Icons.edit), onPressed: (){}, color: Color.fromRGBO(237,73,103, 1),iconSize: 28,)
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                //color: Colors.yellow,
                margin: EdgeInsets.only(left: width*0.25),
                alignment: Alignment.topCenter,
                width: width*0.5,
                height: height*0.18,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Color.fromRGBO(237,73,103, 1),
                      //backgroundImage: AssetImage("assets/images.jpg",),
                      child: Text(c, style: TextStyle(color: Colors.white,fontSize: 50)),
                    ),
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                    //   child: IconButton(
                    //     icon: Icon(
                    //       Icons.add_a_photo,
                    //       size: 38,
                    //       color: Color.fromRGBO(237,73,103, 1),
                    //     ),
                    //     onPressed: () {},
                    //   ),
                    // )
                  ],
                ),
              ),
              _buildContainer(height,width,user),
              _buildContainer(height,width,email),
              _buildContainer(height,width,ph),
              // Text(
              //   "      Advanced Settings",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Color.fromRGBO(237,73,103, 1)),
              // ),
              //AdvSett(width*0.09),
              SizedBox(height: height*0.06,),
              Container(
                height: height*0.06,
                width: width*0.82,
                margin: EdgeInsets.only(bottom: height*0.02,left: width*0.09),
                padding: EdgeInsets.symmetric(horizontal: width*0.05),
                  child: RaisedButton(
                    color: Color.fromRGBO(237, 73, 103, 1),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: ()=>_signOut(context),
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
              ),
            ],
          ),
        ),
    );
  }
}
