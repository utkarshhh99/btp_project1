import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  int i;

  ReportTile(this.i);

  List<String> titles = ["DOMINANT MOOD", "SLEEP", "WATER", "EXERCISE"];
  List<String> description = [
    "Happy",
    "8 hours/day",
    "2.5 L/day",
    "1 hour"
  ];
  List<String> comment = [
    "You did great this week",
    "Recommended 8 hours/day",
    "Recommended 4 L/day",
    "Recommended 1 hour/day"
  ];
  List<String> img = [
    "assets/img3.jpg",
    "assets/img.jpg",
    "assets/img2.jpg",
    "assets/img4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              description[i],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.008,
            ),
            Text(
              comment[i],
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
