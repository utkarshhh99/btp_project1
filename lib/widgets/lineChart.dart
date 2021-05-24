import '../models/water.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatefulWidget {
  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<charts.Series> data;

  List<charts.Series<Water, int>> _createData(){
    final waterData = [
      Water(day: 0, bottles: 1),
      Water(day: 1, bottles: 1),
      Water(day: 2, bottles: 5),
      Water(day: 3, bottles: 10),
      Water(day: 4, bottles: 6),
      Water(day: 5, bottles: 8),
      Water(day: 6, bottles: 3),

    ];
    return [
      charts.Series<Water, int>(
        id: "ok",
        domainFn: (Water w, _) => w.day,
        measureFn: (Water w, _) => w.bottles,
        colorFn: (Water w, _) =>
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
        animationDuration: Duration(milliseconds: 1500),
        domainAxis: charts.NumericAxisSpec(
          tickProviderSpec:
          charts.BasicNumericTickProviderSpec(desiredTickCount: 7),
          tickFormatterSpec: customTickFormatter,
        ),
      ),
    );
  }
}
