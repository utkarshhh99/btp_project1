import 'package:flutter/material.dart';
import '../models/report_duration.dart';

class ReportTile extends StatefulWidget {
  final Duration duration;
  ReportTile({this.duration});
  @override
  _ReportTileState createState() => _ReportTileState();
}

class _ReportTileState extends State<ReportTile> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
              height: deviceHeight*0.01,
            ),
        GestureDetector(
          child: Container(
            // margin: EdgeInsets.only(top: deviceHeight * 0.05),
            decoration: BoxDecoration(
              color: flag ? Colors.black : Color(0xFFff80b3),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.only(
                  top: deviceHeight * 0.01, bottom: deviceHeight * 0.01),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${widget.duration.start}',
                        style: TextStyle(
                          fontSize: deviceHeight * 0.02,
                          color: flag ? Colors.black : Colors.pink,
                        ),
                      ),
                      //     SizedBox(
                      //     width: deviceWidth * 0.2,
                      // ),
                      Text(' - ',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.02,
                            color: flag ? Colors.black : Colors.pink,
                          )),
                      //SizedBox(
                      //width: deviceWidth * 0.2,
                      //),
                      Text('${widget.duration.end}',
                          style: TextStyle(
                            fontSize: deviceHeight * 0.02,
                            color: flag ? Colors.black : Colors.pink,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            flag = !flag;
            setState(() {});
          },
          //Drop Down Button//
          //flag = true;
        ),
        Visibility(
            visible: flag,
//                child: Text('Hi'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      print('Deleting Report');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: deviceHeight * 0.01,
                          bottom: deviceHeight * 0.01,
                          left: deviceWidth * 0.02,
                          right: deviceWidth * 0.02),
                      child: Text(
                        'Delete Report',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(5)),
                    )),
                TextButton(
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ReportPage()));
                      print('Opening Report');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: deviceHeight * 0.01,
                          bottom: deviceHeight * 0.01,
                          left: deviceWidth * 0.02,
                          right: deviceWidth * 0.02),
                      child: Text(
                        'View Report',
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ],
            )),
            SizedBox(
              height: deviceHeight*0.01,
            ),
      ],
    );
  }
}
