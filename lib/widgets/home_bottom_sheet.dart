import 'package:flutter/material.dart';
import '../models/tile_list.dart';
//import '../models/activity_unit.dart';
import 'package:provider/provider.dart';
//import '../widgets/home_tile.dart';

// ignore: must_be_immutable
class BottomCustomSheet extends StatefulWidget {
  //final Activity act;
  final int index;
  //final int count;
  BottomCustomSheet({this.index,this.bottleCount});
   int bottleCount;

  @override
  _BottomCustomSheetState createState() => _BottomCustomSheetState();
}

class _BottomCustomSheetState extends State<BottomCustomSheet> {
  
  


  //int bottleCount = 1;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final activityList = Provider.of<ActivityProvider>(context).activities;
    final act =activityList[widget.index];
    
    // @override
    // initState(){
    //     super.initState();
    //     bottleCount=act.value;
    // }

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(deviceWidth * 2 * 0.012),
        margin: EdgeInsets.only(
            left: deviceWidth * 0.012, right: deviceWidth * 0.012),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(deviceWidth * 0.036),
              topRight: Radius.circular(deviceWidth * 0.036)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Track ${act.title}',
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: deviceHeight * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceWidth * 0.012,
            ),
            Row(
              children: [
                Text(
                  act.modalText,
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: deviceHeight * 0.022,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.08,
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFff80b3),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.014),
                  ),
                  padding: EdgeInsets.all(1),
                  child: SizedBox(
                    child: Container(
                      //margin: EdgeInsets.all(1),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                            GestureDetector(
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: deviceHeight * 0.035,
                                    color: Color(0xFFff80b3)),
                              ),
                              onTap: () {
                                
                                setState(() {
                                  if (widget.bottleCount > 0){
                                   widget.bottleCount=widget.bottleCount-1;
                                   print(widget.bottleCount);
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                            Text(
                              '${widget.bottleCount}',
                              style: TextStyle(
                                fontSize: deviceHeight * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                            GestureDetector(
                              child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: deviceHeight * 0.035,
                                    color: Color(0xFFff80b3)),
                              ),
                              onTap: () {
                                setState(() {
                                  if(widget.bottleCount<24){
                                  widget.bottleCount++;
                                  print(widget.bottleCount);
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: deviceWidth * 0.02,
                            ),
                          ]),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            deviceWidth * 0.014,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.055,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(
                      deviceWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        deviceWidth * 0.014,
                      ),
                      color: Color(0xFFff80b3),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.03, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Provider.of<ActivityProvider>(context,listen: false).setValue(widget.index, widget.bottleCount);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
        height: deviceHeight * 0.29,
      ),
    );
  }
}