import 'package:btp_project1/widgets/report_tile.dart';
import 'package:btp_project1/widgets/suggestion_card.dart';
import 'package:flutter/material.dart';

class ReportDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.08,
          ),
          Text(
            "  Report",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "  April 26th - May 1st",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 5/4.7,maxCrossAxisExtent: 210,crossAxisSpacing: 15,mainAxisSpacing: 15),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (ctx, i) => ReportTile(i)),
          SizedBox(height: height*0.02,),
          SuggestionCard(),
        ],
      ),)
    );
  }
}
