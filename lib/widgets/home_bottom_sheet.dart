import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tile_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BottomCustomSheet extends StatefulWidget {
  final int index;

  BottomCustomSheet({this.index,this.bottleCount});
  int bottleCount;

  @override
  _BottomCustomSheetState createState() => _BottomCustomSheetState();
}

class _BottomCustomSheetState extends State<BottomCustomSheet> {

  void storeData(int index, int count) async {
    var now = DateTime.now();
    int weekDay = now.day;
    int month =now.month;
    var user = FirebaseAuth.instance.currentUser.uid;
    var monthStr= DateFormat.MMMM().format(now);
    print("while confirming "+weekDay.toString() + monthStr);
    if(index==0){
        final url = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/sleep/${user}/$monthStr.json");
        final response = await http.get(url);
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        print(extractedData);
        if(extractedData == null){      //if first time
          print("NO data found");
          final url1 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/sleep/${user}/$monthStr.json");
          final response = await http.post(url1,body:json.encode({
            weekDay.toString() : count,
          }) );
        }
        else{
          String k = "";
          extractedData.forEach((key, value) {
            k = key;
          });
          final url2 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/sleep/${user}/$monthStr/$k.json");
           final response = await http.patch(url2,body:json.encode({
                 weekDay.toString(): count,
              }) );
          }
    }
    else if(index==1){
        final url = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/workout/${user}/$monthStr.json");
        final response = await http.get(url);
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        print(extractedData);
        if(extractedData == null){      //if first time
          print("NO data found");
          final url1 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/workout/${user}/$monthStr.json");
          final response = await http.post(url1,body:json.encode({
            weekDay.toString() : count,
          }) );
        }
        else{
          String k = "";
          extractedData.forEach((key, value) {
            k = key;
          });
          final url2 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/workout/${user}/$monthStr/$k.json");
           final response = await http.patch(url2,body:json.encode({
                 weekDay.toString(): count,
              }) );
          }
    }
    else{
       final url = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/water/${user}/$monthStr.json");
        final response = await http.get(url);
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        print(extractedData);
        if(extractedData == null){      //if first time
          print("NO data found");
          final url1 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/water/${user}/$monthStr.json");
          final response = await http.post(url1,body:json.encode({
            weekDay.toString() : count,
          }) );
        }
        else{
          String k = "";
          extractedData.forEach((key, value) {
            k = key;
          });
          final url2 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/water/${user}/$monthStr/$k.json");
           final response = await http.patch(url2,body:json.encode({
                 weekDay.toString(): count,
              }) );
          }
    } 
  }
  
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
                Flexible(
                  child: Text(
                    act.modalText,
                    overflow: TextOverflow.visible,
                    //textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: deviceHeight * 0.022,
                    ),
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
                    color: Color.fromRGBO(237,73,103, 1),
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
                                    color: Color.fromRGBO(237,73,103, 1)),
                              ),
                              onTap: () {
                                
                                setState(() {
                                  if (widget.bottleCount > 0){
                                   widget.bottleCount=widget.bottleCount-1;
                                   //print(widget.bottleCount);
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
                                    color: Color.fromRGBO(237,73,103, 1)),
                              ),
                              onTap: () {
                                setState(() {
                                  if(widget.bottleCount<24){
                                  widget.bottleCount++;
                                  //print(widget.bottleCount);
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
                      color: Color.fromRGBO(237,73,103, 1),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.03, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Provider.of<ActivityProvider>(context,listen: false).setValue(widget.index, widget.bottleCount);
                    storeData(widget.index,widget.bottleCount);
                    
          
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
