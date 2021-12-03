import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class PiChart extends StatefulWidget {
  Map<String,double> data;

  PiChart(this.data);
  

  @override
  _PiChartState createState() => _PiChartState();
}

class _PiChartState extends State<PiChart> {
  List<Color> colors = [
    Color.fromRGBO(237,73,103, 1),
    Color.fromRGBO(240,120,148,1),
    Color.fromRGBO(240,147,173,1),
    Color.fromRGBO(240,182,202,1),
    Color.fromRGBO(240,201,218,1),
  ];
  // Map<String,double> data = {
  //     '😁' : 0.0,
  //     '😃' : 0.0,
  //     '🙂' : 0.0,
  //     '🙁' : 0.0,
  //     '😞' : 0.0,
  // } ;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _fetchData();
  //   super.initState();
  // }

  // Future<void> _fetchData() async {
  //   var user = FirebaseAuth.instance.currentUser.uid;
  //   var now = DateTime.now();
  //   int weekDay = now.day;
  //   var monthStr = DateFormat.MMMM().format(now);
  //     final url = Uri.parse(
  //         "https://tracker-deck-default-rtdb.firebaseio.com/moodfrequency/${user}/$monthStr.json");
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as Map<String, dynamic>;
  //     String k = "";
  //     extractedData.forEach((key, value) {
  //       k = key;
  //     });
  //     Map<String, dynamic> inner = extractedData[k];
  //     print(inner);
  //     inner.forEach((key, value) {
  //       data[key]=value.toDouble();
  //     });
  //     // if(inner != null)
  //     // data = inner;
  //     // data.forEach((key, value) {
  //     //   value = value.toDouble();
  //     // });

  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List temp = [10.0,10.0,10.0,10.0,10.0];
    
    
    // Map<String , int> map = {
    //   '😁' : 0,
    //   '😃' : 1,
    //   '🙂' : 2,
    //   '🙁' : 3,
    //   '😞' : 4,
    // };
    //int x = map[widget.m];
    //temp[x] = 60.0;
    return Container(
      height: height * 0.2,
      width: width * 0.9,
      padding: EdgeInsets.only(left: width*0.1),
      child: PieChart(
        animationDuration: Duration(milliseconds: 1200),
        chartRadius: height * 0.5,
        chartType: ChartType.ring,
        dataMap: {
          "😁": widget.data["😁"],
          "😃": widget.data["😃"],
          "🙂": widget.data["🙂"],
          "🙁": widget.data["🙁"],
          "😞": widget.data["😞"],
        },
        showLegends: true,

        legendPosition: LegendPosition.right,
        initialAngle: 0,
        //chartValueStyle: TextStyle(color: Color.fromRGBO(234, 243, 250, 1)),
        colorList: colors,
      ),
    );
  }
}
