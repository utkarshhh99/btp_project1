import '../widgets/adv_sett.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          //padding: EdgeInsets.only(left: width*0.09),
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
                  SizedBox(width: width*0.2,),
                  IconButton(icon: Icon(Icons.edit), onPressed: (){}, color: Color.fromRGBO(237,73,103, 1),iconSize: 28,)
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
                      //backgroundImage: AssetImage("assets/images.jpg",),
                      child: Text('U', style: TextStyle(color: Colors.white)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 38,
                          color: Color.fromRGBO(237,73,103, 1),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              _buildContainer(height,width,"Username"),
              _buildContainer(height,width,"Email"),
              _buildContainer(height,width,"Password"),
              Text(
                "      Advanced Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28,color: Color.fromRGBO(237,73,103, 1)),
              ),
              AdvSett(width*0.09),
            ],
          ),
        ),
    );
  }
}
