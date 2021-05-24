import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PiChart extends StatefulWidget {
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

    return Container(
      height: height * 0.2,
      width: width * 0.9,
      padding: EdgeInsets.only(left: width*0.1),
      child: PieChart(
        animationDuration: Duration(milliseconds: 1200),
        chartRadius: height * 0.5,
        chartType: ChartType.ring,
        dataMap: {
          "😁": 20,
          "😃": 50,
          "🙂": 9,
          "🙁": 49,
          "😞": 74,
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
