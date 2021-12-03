import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// ignore: must_be_immutable
class MoodBottomSheet extends StatefulWidget {
  final List<String> display;
  Map<String, int> frequency;
  MoodBottomSheet({this.display, this.frequency});

  @override
  _MoodBottomSheetState createState() => _MoodBottomSheetState();
}

class _MoodBottomSheetState extends State<MoodBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    var user = FirebaseAuth.instance.currentUser.uid;
    var now = DateTime.now();
    var monthStr = DateFormat.MMMM().format(now);

    void storeData() async {
      final url1 = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/reasonfreq/${user}/$monthStr.json");
      widget.frequency.forEach((key, value) async {
        if (value >= 1) {
          final response = await http.get(url1);
          final extractedData =
              json.decode(response.body) as Map<String, dynamic>;
          print(extractedData);
          //{-MpqmGm6OJY7fHHAwP9Z: {Accomplished a goal: 0, Ate something you like: 0, Couldn't finish a scheduled task: 0, Did something I enjoy: 0, Fell sick: 0, Followed normal routine: 0, Had a fight with a loved one: 0, Had a good day at work: 0, Had fun with loved ones: 0, Met new people: 0, Missed an event: 0, Missing a loved one: 0, Spent day being too busy: 0, Spent time with loved ones: 0, Things didn't go well at work: 0}}
          String k = "";
          extractedData.forEach((key, value) {
            k = key;
          });
          int curValue = extractedData[k][key];
          final url2 = Uri.parse(
              "https://tracker-deck-default-rtdb.firebaseio.com/reasonfreq/${user}/$monthStr/$k.json");
          final response2 = await http.patch(url2, body: json.encode({
            key: curValue+value,
          }));
          value=0;
        }
      });
    }

    return Container(
      height: deviceHeight * 0.65,
      //color: Colors.black,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(deviceWidth * 0.075),
          topRight: Radius.circular(deviceWidth * 0.075),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Choose the most appropriate reason :",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.pink)),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          ListView.builder(
            itemBuilder: (ctx, i) =>
                MoodItem(widget.display[i], widget.frequency),
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
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
                color: Color.fromRGBO(237, 73, 103, 1),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                    fontSize: deviceHeight * 0.035, color: Colors.white),
              ),
            ),
            onTap: () {
              //see which ones are ones in local freq map and then push on backend
              storeData();

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MoodItem extends StatefulWidget {
  final String display;
  Map<String, int> frequency;
  MoodItem(this.display, this.frequency);

  @override
  State<MoodItem> createState() => _MoodItemState();
}

class _MoodItemState extends State<MoodItem> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return CheckboxListTile(
      title: Text(
        widget.display,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
      ),
      value: _value,
      onChanged: (bool value) {
        setState(() {
          if (value == true) {
            widget.frequency[widget.display]++;
          } else {
            widget.frequency[widget.display]--;
          }
          _value = value;
          print(widget.display);
          print(widget.frequency[widget.display]);
          //can add frequency increase/decrease logic here (will need index and exact mood)
        });
      },
      activeColor: Colors.pink,
    );
  }
}
