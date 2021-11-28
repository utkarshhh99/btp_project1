import '../widgets/home_bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../models/tile_list.dart';
import 'package:provider/provider.dart';


class HomeTile extends StatefulWidget {
  final index;
  HomeTile({this.index});
  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  var fg = 0;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final activityList = Provider.of<ActivityProvider>(context).activities;
    final activity =activityList[widget.index];

    return Container(
      // width: deviceWidth * 0.5,
      // height: deviceHeight *0.05,
      //color: Colors.red,
      child: GestureDetector(
        onTap: () {
          setState(() {
            fg=1;
          });
          final _myProvider=Provider.of<ActivityProvider>(context,listen: false);
          showModalBottomSheet<void>(
            //isDismissible: false,

            context: context,
            builder: (BuildContext context) {
              return ChangeNotifierProvider.value(value: _myProvider,child:BottomCustomSheet(index:widget.index,bottleCount:activity.value));
              //BottomCustomSheet(index:widget.index);
            },

          ).whenComplete(() => {
              setState(() {
            fg=0;
          })
          });
          
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(deviceWidth * 0.05),
          ),
          color: (fg == 0) ? Colors.white : Color.fromRGBO(237,73,103, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * 0.035, vertical: deviceHeight * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activity.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: deviceHeight * 0.03),
                    ),
                    activity.icon,
                  ],
                ),
                // SizedBox(
                //   height: deviceHeight * 0.05,
                // ),
                Text(
                  '${activity.value} ${activity.unit}',
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: deviceHeight * 0.03),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
