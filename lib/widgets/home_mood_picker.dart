import 'package:btp_project1/models/activity_unit.dart';
import 'package:btp_project1/models/tile_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../widgets/mood_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class MoodPicker extends StatefulWidget {
  @override
  _MoodPickerState createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  List<int> tap = [0, 0, 0, 0, 0];
  //var innerRadius = deviceWidth *;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    var innerRadius = deviceWidth * 0.058;
    var outerRadius = deviceWidth * 0.062;
    void showOptions(int index) {
      List options = Provider.of<ActivityProvider>(context, listen: false)
          .moodOptions[index];
      Map frequency =
          Provider.of<ActivityProvider>(context, listen: false).frequency;
      //final _myProvider=Provider.of<ActivityProvider>(context,listen: false);
      showModalBottomSheet<void>(
        //isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return MoodBottomSheet(
            display: options,
            frequency: frequency,
          );
          //return ChangeNotifierProvider.value(value: _myProvider,child: MoodBottomSheet(display: options,));
          //BottomCustomSheet(index:widget.index);
        },
      );
    }

    Map<int, String> mapMood = {
      0: '😁',
      1: '😃',
      4: '😞',
      3: '🙁',
      2: '🙂',
    };
    var user = FirebaseAuth.instance.currentUser.uid;
    var now = DateTime.now();
    int weekDay = now.day;
    var monthStr = DateFormat.MMMM().format(now);

    Map<String, int> reasonFreq = {
      'Had fun with loved ones': 0,
      'Had a good day at work/school': 0,
      'Accomplished a goal': 0,
      'Spent time with loved ones': 0,
      'Did something I enjoy': 0,
      'Ate something you like': 0,
      'Spent day being too busy': 0,
      'Followed normal routine': 0,
      'Met new people': 0,
      'Couldn\'t finish a scheduled task': 0,
      'Missed an event': 0,
      'Missing a loved one': 0,
      'Fell sick': 0,
      'Had a fight with a loved one': 0,
      'Things didn\'t go well at work': 0,
    };

    void postMoodWithDate(int index) async {
      final url = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/mood/${user}/$monthStr.json");

      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      //print(extractedData);
      if (extractedData == null) {
        //if first time
        print("NO data found");
        final response = await http.post(url,
            body: json.encode({
              weekDay.toString(): mapMood[index],
            }));
        final url1 = Uri.parse(
            "https://tracker-deck-default-rtdb.firebaseio.com/reasonfreq/${user}/$monthStr.json");
        final response1 = await http.post(url1,
            body: json.encode({
              'Had fun with loved ones': 0,
              'Had a good day at work': 0,
              'Accomplished a goal': 0,
              'Spent time with loved ones': 0,
              'Did something I enjoy': 0,
              'Ate something you like': 0,
              'Spent day being too busy': 0,
              'Followed normal routine': 0,
              'Met new people': 0,
              'Couldn\'t finish a scheduled task': 0,
              'Missed an event': 0,
              'Missing a loved one': 0,
              'Fell sick': 0,
              'Had a fight with a loved one': 0,
              'Things didn\'t go well at work': 0,
            }));
      } else {
        Map<String, dynamic> inner = extractedData;
        String k = "";
        inner.forEach((key, value) {
          k = key;
        });
        final url2 = Uri.parse(
            "https://tracker-deck-default-rtdb.firebaseio.com/mood/${user}/$monthStr/$k.json");
        final response = await http.patch(url2,
            body: json.encode({
              weekDay.toString(): mapMood[index],
            }));
      }
    }

    void postMoodWithFreq(int index) async {
      final url = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/moodfrequency/${user}/$monthStr.json");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      //print(extractedData);

      if (extractedData == null) {
        //if first time
        //print("NO data found");
        final url1 = Uri.parse(
            "https://tracker-deck-default-rtdb.firebaseio.com/moodfrequency/${user}/$monthStr.json");
        final response = await http.post(url1,
            body: json.encode({
              '😁': 0,
              '😃': 0,
              '🙂': 0,
              '🙁': 0,
              '😞': 0,
            }));
      }
      final response1 = await http.get(url);
      final extractedData1 =
          json.decode(response1.body) as Map<String, dynamic>;
      Map<String, dynamic> inner = extractedData1;
      //print(inner); //{-Mpoq68Qrm12JYtXabI-: {😁: 0, 😃: 0, 😞: 0, 🙁: 0, 🙂: 0}}
      String k = "";
      inner.forEach((key, value) {
        k = key;
      });
      Map<String, dynamic> inner2 = inner[k];
      //print(inner2); //{😁: 0, 😃: 0, 😞: 0, 🙁: 0, 🙂: 0}
      int curValue = inner2[mapMood[index]];
      //print(curValue);print(mapMood[index]);
      final url2 = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/moodfrequency/${user}/$monthStr/$k.json");
      final response2 = await http.patch(url2,
          body: json.encode({
            mapMood[index]: curValue + 1,
          }));
    }

    Future<bool> checkState() async {
      final url = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/mood/${user}/$monthStr.json");

      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null){ print(1);return Future<bool>.value(true);}
      Map<String, dynamic> inner = extractedData;
      print(inner);
      String k = "";
      inner.forEach((key, value) {
        k = key;
      });
      final url2 = Uri.parse(
          "https://tracker-deck-default-rtdb.firebaseio.com/mood/${user}/$monthStr/$k.json");
      final response1 = await http.get(url2);
      final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
      print(extractedData1);
      if (extractedData1.containsKey(DateTime.now().day.toString()))
        return Future<bool>.value(false);

      return Future<bool>.value(true);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () async {
              bool result = await checkState();
              print(result);
              if (result == true) {
                Provider.of<ActivityProvider>(context, listen: false)
                    .setMood("😁");
                int k = 0;
                tap[k] = 1 ^ tap[k];
                for (int i = 0; i < 5; i++) {
                  if (i != k) tap[i] = 0;
                }

                postMoodWithDate(k);
                postMoodWithFreq(k);
                sleep(Duration(seconds: 1));
                showOptions(k);
                setState(() {});
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You have already entered mood today!"),));
              }
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: tap[0] == 1
                      ? Color.fromRGBO(237, 73, 103, 1)
                      : Color.fromRGBO(240, 201, 218, 1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😁',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240, 201, 218, 1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Good',
                  style: TextStyle(
                    color: tap[0] == 1
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.035),
        GestureDetector(
            onTap: () async {
              bool result = await checkState();
              if(result) {
                  Provider.of<ActivityProvider>(context, listen: false)
                  .setMood("😃");
              int k = 1;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 2nd');

              postMoodWithDate(k);
              postMoodWithFreq(k);
              sleep(Duration(seconds: 1));
              showOptions(k);
              setState(() {});
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You have already entered mood today!"),));
              }
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: tap[1] == 1
                      ? Color.fromRGBO(237, 73, 103, 1)
                      : Color.fromRGBO(240, 201, 218, 1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😃',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240, 201, 218, 1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Good',
                  style: TextStyle(
                    color: tap[1] == 1
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.035),
        GestureDetector(
            onTap: () async  {
              bool result = await checkState();
              if(result) {
                  Provider.of<ActivityProvider>(context, listen: false)
                  .setMood("🙂");
              int k = 2;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 3rd');

              postMoodWithDate(k);
              postMoodWithFreq(k);
              sleep(Duration(seconds: 1));
              showOptions(k);
              setState(() {});
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You have already entered mood today!"),));
              }
              
              
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: tap[2] == 1
                      ? Color.fromRGBO(237, 73, 103, 1)
                      : Color.fromRGBO(240, 201, 218, 1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙂',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240, 201, 218, 1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Neutral',
                  style: TextStyle(
                    color: tap[2] == 1
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.035),
        GestureDetector(
            onTap: () async {
               bool result = await checkState();
              if(result) {
                  Provider.of<ActivityProvider>(context, listen: false)
                  .setMood("🙁");
              int k = 3;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 4th');

              postMoodWithDate(k);
              postMoodWithFreq(k);
              sleep(Duration(seconds: 1));
              showOptions(k);
              setState(() {});


                
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You have already entered mood today!"),));
              }
               
              
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: tap[3] == 1
                      ? Color.fromRGBO(237, 73, 103, 1)
                      : Color.fromRGBO(240, 201, 218, 1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙁',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240, 201, 218, 1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Sad',
                  style: TextStyle(
                    color: tap[3] == 1
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.035),
        GestureDetector(
            onTap: () async {
              bool result = await checkState();
              if(result) {
                  Provider.of<ActivityProvider>(context, listen: false)
                  .setMood("😞");
              int k = 4;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 5th');

              postMoodWithDate(k);
              postMoodWithFreq(k);
              sleep(Duration(seconds: 1));
              showOptions(k);
              setState(() {});


                
              }
              else{
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("You have already entered mood today!"),));
              }
              
              
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: tap[4] == 1
                      ? Color.fromRGBO(237, 73, 103, 1)
                      : Color.fromRGBO(240, 201, 218, 1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😞',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240, 201, 218, 1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Sad',
                  style: TextStyle(
                    color: tap[4] == 1
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.black,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
