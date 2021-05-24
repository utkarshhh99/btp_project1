import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  final String dominantMood = '😁';
  final int avgSleep = 6;
  final int targetSleep = 7;
  final int avgBottles = 4;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: deviceHeight * 0.06,
          left: deviceWidth * 0.06,
          right: deviceWidth * 0.06,
        ),
        child: SingleChildScrollView( 
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
//                            height: deviceHeight * 0.3,
                            width: deviceWidth * 0.5,
                            child: Center(child:Image.network('https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/whatsapp/238/grinning-face-with-smiling-eyes_1f601.png'),
                            )),
                      ],
                    ),
                    Text(
                      'Your Dominant Mood',
                      style: TextStyle(
                        fontSize: deviceHeight * 0.04,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
             SizedBox(
                height: deviceHeight * 0.01,
              ),
              Suggestion(icon: Icons.check_circle_outline, color: Colors.green , suggestion: 'DOs 1',),
              Suggestion(icon: Icons.check_circle_outline, color: Colors.green , suggestion: 'DOs 2',),
              Suggestion(icon: Icons.check_circle_outline, color: Colors.green , suggestion: 'DOs 3',),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Suggestion(icon: Icons.cancel_outlined, color: Colors.red , suggestion: 'DONTs 1',),
              Suggestion(icon: Icons.cancel_outlined, color: Colors.red , suggestion: 'DONTs 2',),
              Suggestion(icon: Icons.cancel_outlined, color: Colors.red , suggestion: 'DONTs 3',),

              Container(
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
//                color: Colors.black,
                child: Image.network('https://previews.123rf.com/images/chudtsankov/chudtsankov1606/chudtsankov160600150/58231674-cartoon-illustation-of-a-water-plastic-bottle-mascot-character-waving-waving-for-greeting.jpg',),
              ),
              Text(
                'Your average water intake is $avgBottles bottles',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: deviceHeight * 0.02
                ),

              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Text('🌎',
                      style: TextStyle(
                        fontSize: deviceHeight * 0.035
                      ),)
                  ),
                  SizedBox(width: deviceWidth*0.02,),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'According to WHO, average global water intake is 10 bottles per day',
                      style: TextStyle(
                        fontSize: deviceHeight * 0.019
                      ),
                    ),
                  ),
                ],

              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Container(
                width: deviceWidth * 0.4,
                height: deviceWidth * 0.4,
//                color: Colors.black,
                child: Image.network('https://clipart-library.com/images/dT9XgydBc.jpg',),
              ),
              Text(
                'Your average sleep duration is $avgSleep hrs',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: deviceHeight * 0.02
                ),

              ),
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      (targetSleep<avgSleep)?'According to the target sleep hours you\'ve slept extra':'According to the target sleep hours you\'ve slept less'
                  ),
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Suggestion extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String suggestion;
  Suggestion({
    this.color,
    this.icon,
    this.suggestion,
});
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: deviceHeight * 0.005
      ),
      child: Row(
        children: [
          Icon(icon, color: color,),
          SizedBox(
            width: deviceWidth * 0.01,
          ),
          Text(
            suggestion,
            style: TextStyle(
              fontSize: 14
            ),
          ),
        ],
      ),
    );
  }
}
