import '../models/water.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatefulWidget {
  Map<String,dynamic> val;
  LineChart(this.val);

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List<charts.Series> data;

  List<charts.Series<Water, int>> _createData(){
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

    final waterData = [
      Water(day: 0, bottles: temp[0]),
      Water(day: 1, bottles: temp[1]),
      Water(day: 2, bottles: temp[2]),
      Water(day: 3, bottles: temp[3]),
      Water(day: 4, bottles: temp[4]),
      Water(day: 5, bottles: temp[5]),
      Water(day: 6, bottles: temp[6]),

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
