import 'package:btp_project1/screens/report_detail_screen.dart';
import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return InkWell(child: Column(
      children: [
        Container(
          height: height*0.09,
          width: width,
          padding: EdgeInsets.only(left: width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("DECEMBER",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: height*0.01,),
              Text("1st - 31st",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.grey)),
            ],
          ),
        ),
        Divider(thickness: 1,),
      ],
    ),
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ReportDetailScreen()));
    },
    );
  }
}
