import 'dart:convert';

import 'package:btp_project1/widgets/lineChart2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../widgets/lineChart1.dart';
import '../widgets/lineChart.dart';
import '../widgets/pieChart.dart';
import 'package:flutter/material.dart';
import 'package:btp_project1/models/tile_list.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatefulWidget {
  //StatisticsScreen(this.sleep,this.workout,this.water);
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  var tab = "water";
  bool isLoading = false;
  Map<String, dynamic> sleep = {'0' : 0};
  Map<String, dynamic> workout = {'0' : 0};
  Map<String, dynamic> water = {'0' : 0};

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
    var monthStr = DateFormat.MMMM().format(now);

    var url1 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/sleep/$user/$monthStr.json");
    var url2 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/workout/$user/$monthStr.json");
    var url3 = Uri.parse(
        "https://tracker-deck-default-rtdb.firebaseio.com/water/$user/$monthStr.json");

    final response1 = await http.get(url1);
    final response2 = await http.get(url2);
    final response3 = await http.get(url3);

    final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
    final extractedData2 = json.decode(response2.body) as Map<String, dynamic>;
    final extractedData3 = json.decode(response3.body) as Map<String, dynamic>;
    if(extractedData1!=null){
      extractedData1.forEach((key, value) {
        for(int i=1;i<value.length;i++){
          sleep.putIfAbsent(i.toString(), () => value[i]);
        }
      });
    }
    if(extractedData2!=null){
      extractedData2.forEach((key, value) {
        for(int i=1;i<value.length;i++){
          workout.putIfAbsent(i.toString(), () => value[i]);
        }
      });
    }
    if(extractedData3!=null){
      extractedData3.forEach((key, value) {
        for(int i=1;i<value.length;i++){
          water.putIfAbsent(i.toString(), () => value[i]);
        }
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final activities =
        Provider.of<ActivityProvider>(context, listen: true).activities;
    String m = Provider.of<ActivityProvider>(context).getMood();
    int s = activities[0].value;
    int w = activities[2].value;
    int wo = activities[1].value;
    return Scaffold(
      body: isLoading
          ? Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(237, 73, 103, 1))),
          )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "      Statistics",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                PiChart(m),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          tab = 'water';
                        });
                      },
                      child: Text(
                        'Water',
                        style: TextStyle(
                            color: tab == 'water'
                                ? Colors.black
                                : Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tab = 'sleep';
                        });
                      },
                      child: Text(
                        'Sleep',
                        style: TextStyle(
                            color: tab == 'sleep'
                                ? Colors.black
                                : Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          tab = 'workout';
                        });
                      },
                      child: Text(
                        'Workout',
                        style: TextStyle(
                            color: tab == 'workout'
                                ? Colors.black
                                : Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: width * 0.33,
                        child: Divider(
                          color: tab == 'water'
                              ? Color.fromRGBO(237, 73, 103, 1)
                              : Colors.grey[400],
                          thickness: tab == 'water' ? 4 : 2,
                        )),
                    Container(
                        width: width * 0.33,
                        child: Divider(
                          color: tab == 'sleep'
                              ? Color.fromRGBO(237, 73, 103, 1)
                              : Colors.grey[400],
                          thickness: tab == 'sleep' ? 4 : 2,
                        )),
                    Container(
                        width: width * 0.33,
                        child: Divider(
                          color: tab == 'workout'
                              ? Color.fromRGBO(237, 73, 103, 1)
                              : Colors.grey[400],
                          thickness: tab == 'workout' ? 4 : 2,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                tab == 'water'
                    ? LineChart(water)
                    : tab == 'sleep'
                        ? LineChart1(sleep)
                        : LineChart2(workout),
              ],
            ),
    );
  }
}
