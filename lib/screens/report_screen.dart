import 'package:btp_project1/widgets/report_item.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width*0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.08,),
          Text("Reports",style: TextStyle(fontSize: height*0.035,fontWeight: FontWeight.bold),),
          ListView.builder(itemBuilder: (ctx,i)=> ReportItem(),itemCount: 1,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
        ],
      ),
    );
  }
}
