import '../screens/settings_screen.dart';
import 'package:flutter/material.dart';

class HelloBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.1,
      width: deviceWidth * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Utkarsh, ',
                style: TextStyle(
                    fontSize: deviceHeight * 0.04, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Text(
                'How are you today?',
                style: TextStyle(
                    fontSize: deviceHeight * 0.03, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          //SizedBox(width:deviceWidth*0.1),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SettingsScreen()));
            },
            child: CircleAvatar(
              child: Text('U', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: deviceHeight*0.03)),
              radius: deviceWidth * 0.07,
              backgroundColor: Color.fromRGBO(237,73,103, 1),
              //foregroundColor: Color(0xFF800033),
            ),
          ),
        ],
      ),
    );
  }
}
