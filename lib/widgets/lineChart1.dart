import '../models/sleep.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class LineChart1 extends StatefulWidget {
  Map<String,dynamic> val;
  LineChart1(this.val);
  @override
  _LineChart1State createState() => _LineChart1State();
}

class _LineChart1State extends State<LineChart1> {
  List<charts.Series> data;

  List<charts.Series<Sleep, int>> _createData(){
    List temp = [0,0,0,0,0,0,0];
    var now = DateTime.now();
    int date = now.day;  //1
    //int date = 9;
    temp[6] = widget.val[date.toString()] == null ? 0 : widget.val[date.toString()];
    for(int i=6;i>0;i--){
      if(widget.val.containsKey((date-i).toString()) && (date-i)!=0){
        temp[6-i] = widget.val[(date-i).toString()];
      }
    }
    //print(temp);
    final sleepData = [
      Sleep(day: 0, hours: temp[0]),
      Sleep(day: 1, hours: temp[1]),
      Sleep(day: 2, hours: temp[2]),
      Sleep(day: 3, hours: temp[3]),
      Sleep(day: 4, hours: temp[4]),
      Sleep(day: 5, hours: temp[5]),
      Sleep(day: 6, hours: temp[6]),

    ];
    return [
      charts.Series<Sleep, int>(
        id: "ok",
        domainFn: (Sleep s, _) => s.day,
        measureFn: (Sleep s, _) => s.hours,
        colorFn: (Sleep s, _) =>
            charts.Color.fromHex(code: '#ED4967'),
        data: sleepData,
      )
    ];
  }

  @override
  void initState() {
    data = _createData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var now = DateTime.now();
    int date = now.day;
    final customTickFormatter =
    charts.BasicNumericTickFormatterSpec((num value) {
      if (value == 0) {
        return (date-6).toString();
      } else if (value == 1) {
        return (date-5).toString();
      } else if (value == 2) {
        return (date-4).toString();
      } else if (value == 3) {
        return (date-3).toString();
      } else if (value == 4) {
        return (date-2).toString();
      } else if (value == 5) {
        return (date-1).toString();
      }
      return date.toString();

    });
    return Container(
      height: height * 0.3,
      width: width * 0.95,
      padding: EdgeInsets.only(left: width*0.06),
      //color: Colors.yellow,
      child: charts.LineChart(
        data,
        animate: true,
        animationDuration: Duration(milliseconds: 1800),
        domainAxis: charts.NumericAxisSpec(
          tickProviderSpec:
          charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
          tickFormatterSpec: customTickFormatter,
        ),
      ),
    );
  }
}
