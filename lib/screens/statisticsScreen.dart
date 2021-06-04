import 'package:btp_project1/widgets/lineChart2.dart';

import '../widgets/lineChart1.dart';
import '../widgets/lineChart.dart';
import '../widgets/pieChart.dart';
import 'package:flutter/material.dart';
import 'package:btp_project1/models/tile_list.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  var tab = "water";

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
      body: Column(
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
                      color: tab == 'water' ? Colors.black : Colors.grey[400],
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
                      color: tab == 'sleep' ? Colors.black : Colors.grey[400],
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
                    tab = 'exercise';
                  });
                },
                child: Text(
                  'Exercise',
                  style: TextStyle(
                      color:
                          tab == 'exercise' ? Colors.black : Colors.grey[400],
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
                    color: tab == 'exercise'
                        ? Color.fromRGBO(237, 73, 103, 1)
                        : Colors.grey[400],
                    thickness: tab == 'exercise' ? 4 : 2,
                  )),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          tab == 'water' ? LineChart(w) : tab == 'sleep' ? LineChart1(s) : LineChart2(wo),
        ],
      ),
    );
  }
}
