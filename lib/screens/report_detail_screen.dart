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
  double sleep = 0;
  double workout = 0;
  double water = 0;
  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData()async{
    setState(() {
      isLoading = true;
    });
    var user = FirebaseAuth.instance.currentUser.uid;
    var now = DateTime.now();
    int date = now.day;
    var monthStr= DateFormat.MMMM().format(now);

    var url1 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/sleep/$user/$monthStr.json");
    var url2 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/workout/$user/$monthStr.json");
    var url3 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/water/$user/$monthStr.json");

    final response1 = await http.get(url1);
    final response2 = await http.get(url2);
    final response3 = await http.get(url3);

    final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
    final extractedData2 = json.decode(response2.body) as Map<String, dynamic>;
    final extractedData3 = json.decode(response3.body) as Map<String, dynamic>;

    if(extractedData1!=null){
      extractedData1.forEach((key, value) {
        for(int i=1;i<value.length;i++) sleep = sleep + value[i];

      });
    }
    if(extractedData2!=null){
      extractedData2.forEach((key, value) {
        for(int i=1;i<value.length;i++) workout = workout + value[i];

      });
    }
    if(extractedData3!=null){
      extractedData3.forEach((key, value) {
        for(int i=1;i<value.length;i++) water = water + value[i];

      });
    }

    if(month=="January"||month=="March"||month=="May"||month=="July"||month=="August"||month=="October"||month=="December"){
      sleep = sleep/31;
      workout = workout/31;
      water = water/31;
    }
    else if(month=="April"||month=="June"||month=="September"||month=="November"){
      sleep = sleep/30;
      workout = workout/30;
      water = water/30;
    }
    else{
      sleep = sleep/28;
      workout = workout/28;
      water = water/28;
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
      body: isLoading ? Center(
        child: CircularProgressIndicator(valueColor:
        new AlwaysStoppedAnimation<Color>(Color.fromRGBO(237, 73, 103, 1))),
      ) : SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child:  Column(
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
                color:  Colors.black,
              ),
              label: Text(
                "Back",
                style: TextStyle(
                    color:  Colors.black),
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
          if(month=="January"||month=="March"||month=="May"||month=="July"||month=="August"||month=="October"||month=="December")
            Text(
            "  "+month+"  1st - 31th",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          if(month=="April"||month=="June"||month=="September"||month=="November")
            Text(
              "  "+month+"  1st - 30th",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          if(month=="February")
            Text(
              "  "+month+"  1st - 28th",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 5/4.7,maxCrossAxisExtent: 210,crossAxisSpacing: 15,mainAxisSpacing: 15),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (ctx, i) => ReportTile(i,sleep,workout,water)),
          SizedBox(height: height*0.02,),
          SuggestionCard(),
        ],
      ),)
    );
  }
}
