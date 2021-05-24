import '../models/sleep.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart1 extends StatefulWidget {
  @override
  _LineChart1State createState() => _LineChart1State();
}

class _LineChart1State extends State<LineChart1> {
  List<charts.Series> data;

  List<charts.Series<Sleep, int>> _createData(){
    final waterData = [
      Sleep(day: 0, hours: 1),
      Sleep(day: 1, hours: 1),
      Sleep(day: 2, hours: 5),
      Sleep(day: 3, hours: 10),
      Sleep(day: 4, hours: 6),
      Sleep(day: 5, hours: 8),
      Sleep(day: 6, hours: 3),

    ];
    return [
      charts.Series<Sleep, int>(
        id: "ok",
        domainFn: (Sleep s, _) => s.day,
        measureFn: (Sleep s, _) => s.hours,
        colorFn: (Sleep s, _) =>
            charts.Color.fromHex(code: '#ED4967'),
        data: waterData,
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
    final customTickFormatter =
    charts.BasicNumericTickFormatterSpec((num value) {
      if (value == 0) {
        return "Mon";
      } else if (value == 1) {
        return "Tue";
      } else if (value == 2) {
        return "Wed";
      } else if (value == 3) {
        return "Thr";
      } else if (value == 4) {
        return "Fri";
      } else if (value == 5) {
        return "Sat";
      } 
        return "Sun";
      
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
