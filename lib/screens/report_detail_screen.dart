import 'package:btp_project1/widgets/report_tile.dart';
import 'package:btp_project1/widgets/suggestion_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReportDetailScreen extends StatefulWidget {
  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  var month = DateFormat.MMMM().format(DateTime.now());
  bool isLoading = false;
  double sleep = 0.0;
  double workout = 0.0;
  double water = 0.0;
  String dommood = '🙂';
  List<String> suggestions=[];
  Map<String, String> moodName = {
      '😁': 'Happy',
      '😃': 'Good',
      '🙂': 'Neutral',
      '🙁': 'Sad',
      '😞': 'Very Sad',
    };
     
    Map<String, String> moodMessage ={
      '😁': 'You did great this month',
      '😃': 'You did great this month',
      '🙂': 'You did great this month',
      '🙁': 'Your mood was mostly off this month',
      '😞': 'Your mood was mostly off this month',
    };

    Map<String, String> displayText = {
    'Had fun with loved ones': 'Spend more time with loved ones',
    'Had a good day at work': 'Try being more productive at work',
    'Accomplished a goal': 'Try setting more achievable goals',
    'Spent time with loved ones': 'Spend more time with loved ones',
    'Did something I enjoy': 'Do things you enjoy',
    'Ate something you like': 'Eat your favorite food more frequently',
    'Spent day being too busy': 'Find time outside work',
    'Followed normal routine': 'Try learning something new',
    'Met new people': 'Talk to new people',
    'Couldn\'t finish a scheduled task': 'Prioritise your scheduled tasks',
    'Missed an event': 'Keep track of scheduled events',
    'Missing a loved one': 'Stay in touch with loved ones',
    'Fell sick': 'Look after your health',
    'Had a fight with a loved one': 'Don\'t engage in heated arguments',
    'Things didn\'t go well at work': 'Manage your work better',
  };

  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });
    var user = FirebaseAuth.instance.currentUser.uid;
    var now = DateTime.now();
    int date = now.day;
    var monthStr = DateFormat.MMMM().format(now);

    var url1 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/sleep/$user/$monthStr.json");
    var url2 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/workout/$user/$monthStr.json");
    var url3 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/water/$user/$monthStr.json");
    var url4 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/moodfrequency/$user/$monthStr.json");

    final response1 = await http.get(url1);
    final response2 = await http.get(url2);
    final response3 = await http.get(url3);
    final response4 = await http.get(url4);

    final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
    final extractedData2 = json.decode(response2.body) as Map<String, dynamic>;
    final extractedData3 = json.decode(response3.body) as Map<String, dynamic>;
    final extractedData4 = json.decode(response4.body) as Map<String, dynamic>;

    if (extractedData1 != null) {
      extractedData1.forEach((key, value) {
        for (int i = 1; i < value.length; i++) {
          if (value[i] == null) continue;
          sleep = sleep + value[i];
        }
      });
    }
    if (extractedData2 != null) {
      extractedData2.forEach((key, value) {
        for (int i = 1; i < value.length; i++) {
          if (value[i] == null) continue;
          workout = workout + value[i];
        }
      });
    }
    if (extractedData3 != null) {
      extractedData3.forEach((key, value) {
        for (int i = 1; i < value.length; i++) {
          if (value[i] == null) continue;
          water = water + value[i];
        }
      });
    }

    if (extractedData4 != null) {
      String k = "";
      extractedData4.forEach((key, value) {
        k = key;
      });
      Map<String, dynamic> inner = extractedData4[k];
      int mvalue = inner[dommood];
      inner.forEach((key, value) {
        if (value > mvalue) {
          mvalue = value;
          dommood = key;
        }
      });
    }
    final url5 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/reasonfreq/${user}/$monthStr.json");
    final response5 = await http.get(url5);
    final extractedData5 = json.decode(response5.body) as Map<String, dynamic>;
    //print(extractedData5);
    String k = "";
    extractedData5.forEach((key, value) {
      k = key;
    });
    Map<String, dynamic> inner5 = extractedData5[k];
    print(inner5);
    print('method working');
    List<String> temp;
    inner5.forEach((key, value) {
        if(value>=1){
            suggestions.add(displayText[key]);

        }
     });

    print(suggestions);

    if (month == "January" ||
        month == "March" ||
        month == "May" ||
        month == "July" ||
        month == "August" ||
        month == "October" ||
        month == "December") {
      sleep = sleep / 31;
      workout = workout / 31;
      water = water / 31;
    } else if (month == "April" ||
        month == "June" ||
        month == "September" ||
        month == "November") {
      sleep = sleep / 30;
      workout = workout / 30;
      water = water / 30;
    } else {
      sleep = sleep / 28;
      workout = workout / 28;
      water = water / 28;
    }
    setState(() {
      isLoading = false;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(237, 73, 103, 1))),
              )
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
                          color: Colors.black,
                        ),
                        label: Text(
                          "Back",
                          style: TextStyle(color: Colors.black),
                        )),
                    Text(
                      "  Report",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    if (month == "January" ||
                        month == "March" ||
                        month == "May" ||
                        month == "July" ||
                        month == "August" ||
                        month == "October" ||
                        month == "December")
                      Text(
                        "  " + month + "  1st - 31th",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    if (month == "April" ||
                        month == "June" ||
                        month == "September" ||
                        month == "November")
                      Text(
                        "  " + month + "  1st - 30th",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    if (month == "February")
                      Text(
                        "  " + month + "  1st - 28th",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 5 / 4.7,
                            maxCrossAxisExtent: 210,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (ctx, i) =>
                            ReportTile(i, sleep, workout, water,moodName[dommood],moodMessage[dommood])),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SuggestionCard(suggestions),
                  ],
                ),
              ));
  }
}
