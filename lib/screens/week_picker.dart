//import '../screens/report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/report_tile.dart';
import '../models/report_duration.dart';

class WeekPicker extends StatefulWidget {
  @override
  _WeekPickerState createState() => _WeekPickerState();
}

class _WeekPickerState extends State<WeekPicker> {
  //final List<Duration> weeks = [ Duration(start:'21 May, 2021', end: '28 May, 2021'), Duration(start:'29 May, 2021', end: '05 June, 2021'),Duration(start:'21 May, 2021', end: '28 May, 2021'), Duration(start:'29 May, 2021', end: '05 June, 2021'),];
  // TransactionList(this.transactions); //add this constructor
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth * 0.08,
          right: deviceWidth * 0.08,
          top: deviceHeight * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //    crossAxisAlignment: CrossAxisAlignment.baseline,

              children: [
                Text(
                  'Reports',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: deviceHeight * 0.04),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                )
              ],
            ),
            Container(
              //height: deviceHeight * 0.75,
              width: deviceWidth,
              child: ListView.builder(
                itemCount: durations.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return ReportTile(
                    duration: durations[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Duration extends StatefulWidget {
//   final String start;
//   final String end;
// //  static bool flag = false;
// //  final bool flag;
//  // final bool flag = false;

//   Duration({this.start, this.end});

//   @override
//   _DurationState createState() => _DurationState();
// }

// class _DurationState extends State<Duration> {
//    bool flag = false;
//   @override
//   Widget build(BuildContext context) {
//     final deviceWidth = MediaQuery.of(context).size.width;
//     final deviceHeight = MediaQuery.of(context).size.height;
//     return Column(
//       children: [
//         GestureDetector(
//           child: Container(
//            // margin: EdgeInsets.only(top: deviceHeight * 0.05),
//             decoration: BoxDecoration(
//               color: flag? Colors.black:Color(0xFFff80b3),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Container(

//               margin: EdgeInsets.all(1),
//               padding: EdgeInsets.only(top: deviceHeight * 0.01, bottom: deviceHeight * 0.01),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//               borderRadius: BorderRadius.circular(5),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text('${widget.start}', style: TextStyle(fontSize: deviceHeight*0.02, color: flag? Colors.black:Colors.pink,),),
//                  //     SizedBox(
//                    //     width: deviceWidth * 0.2,
//                      // ),
//                       Text(' - ', style: TextStyle(fontSize: deviceHeight*0.02, color: flag? Colors.black:Colors.pink,)),
//                       //SizedBox(
//                         //width: deviceWidth * 0.2,
//                       //),
//                       Text('${widget.end}', style: TextStyle(fontSize: deviceHeight*0.02, color: flag? Colors.black:Colors.pink,)),
//                     ],
//                   ),

//                 ],
//               ),
//             ),
//           ),
//           onTap: (){
//             flag = !flag;
//             setState(() {

//             });

//           },
//             //Drop Down Button//
//             //flag = true;
//         ),
//         Visibility(
//             visible: flag,
// //                child: Text('Hi'),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 TextButton(onPressed: (){
//                   print('Deleting Report');
//                 },
//                     child: Container( padding: EdgeInsets.only(top: deviceHeight * 0.01, bottom: deviceHeight * 0.01, left: deviceWidth * 0.02, right: deviceWidth * 0.02),child: Text('Delete Report', style: TextStyle(color: Colors.white),), decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(5)),)
//                 ),
//                 TextButton(onPressed: (){
//                   //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ReportPage()));
//                   print('Opening Report');
//                 },     child: Container( padding: EdgeInsets.only(top: deviceHeight * 0.01, bottom: deviceHeight * 0.01, left: deviceWidth * 0.02, right: deviceWidth * 0.02),child: Text('View Report', style: TextStyle(color: Colors.white),), decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(5)),)
//                 ),
//               ],
//             )
//         )
//       ],
//     );
//   }
// }
