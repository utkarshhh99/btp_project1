import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PiChart extends StatefulWidget {
  String m;

  PiChart(this.m);

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List temp = [10.0,10.0,10.0,10.0,10.0];
    Map<String , int> map = {
      '😁' : 0,
      '😃' : 1,
      '🙂' : 2,
      '🙁' : 3,
      '😞' : 4,
    };
    int x = map[widget.m];
    temp[x] = 60.0;
    return Container(
      height: height * 0.2,
      width: width * 0.9,
      padding: EdgeInsets.only(left: width*0.1),
      child: PieChart(
        animationDuration: Duration(milliseconds: 1200),
        chartRadius: height * 0.5,
        chartType: ChartType.ring,
        dataMap: {
          "😁": temp[0],
          "😃": temp[1],
          "🙂": temp[2],
          "🙁": temp[3],
          "😞": temp[4],
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
