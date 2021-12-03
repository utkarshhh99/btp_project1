import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  final int i;
  double sleep;
  double workout;
  double water;
  String moodName;
  String moodCom;
  ReportTile(this.i,this.sleep,this.workout,this.water,this.moodName,this.moodCom);

  final List<String> titles = ["DOMINANT MOOD", "SLEEP", "WATER", "WORKOUT"];
   List<String> description = [
    "Happy",
    " hours/day",
    " L/day",
    " hour/day"
  ];
 
  final List<String> comment = [
    "You did great this week",
    "Recommended 7-9 hrs/day",
    "Recommended 2 L/day",
    "Recommended 0.5 hrs/day"
  ];
  final List<String> img = [
    "assets/img6.jpeg",
    "assets/img.jpg",
    "assets/img2.jpg",
    "assets/img4.jpg"
  ];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _fetchData();
    
  // }

  // void _fetchData(){
  //   print('111');
  //    description[0] = moodName;
  //    comment[0]= moodCom;

  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String sl = sleep.toString().substring(0,3);
    String wo = workout.toString().substring(0,3);
    String wa = water.toString().substring(0,3);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titles[i],
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Container(
              height: height * 0.06,
              width: width * 0.1,
              child: Image.asset(
                img[i],
                fit: BoxFit.cover,
              ),
              margin:
                  EdgeInsets.only(bottom: height * 0.01, top: height * 0.007),
            ),
            Text(
              i==1 ? sl+description[i] : i==2 ? wa+description[i] : i==3 ? wo+description[i] : moodName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.008,
            ),
            Text(
              i==0? moodCom:comment[i],
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
