import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class SuggestionCard extends StatefulWidget {
  List<String> suggestions;
  SuggestionCard(this.suggestions);
  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  List<Icon> icons = [
    Icon(
      Icons.check_circle,
      color: Colors.green,
    ),
    Icon(
      Icons.remove_circle,
      color: Colors.red,
    )
  ];

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

  //List<String> suggestions=[];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _fetchData();
    
  //   super.initState();
  // }

  var user = FirebaseAuth.instance.currentUser.uid;

  var monthStr = DateFormat.MMMM().format(DateTime.now());
  

  Future<void> _fetchData() async {
    
     //suggestions=temp;
     }

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
        //height: height*0.35,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TASK SUMMARY",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, i) {
                return Container(
                  height: height * 0.04,
                  child: ListTile(
                    title: Text(widget.suggestions[i]),
                    leading: icons[0],
                  ),
                );
              },
              itemCount: widget.suggestions.length,
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
