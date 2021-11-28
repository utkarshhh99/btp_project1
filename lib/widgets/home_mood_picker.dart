import 'package:btp_project1/models/activity_unit.dart';
import 'package:btp_project1/models/tile_list.dart';
import '../widgets/mood_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoodPicker extends StatefulWidget {
  @override
  _MoodPickerState createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  List<int> tap = [0, 0, 0, 0, 0];
  //var innerRadius = deviceWidth *;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    var innerRadius = deviceWidth * 0.058;
    var outerRadius = deviceWidth * 0.062;
    void showOptions(int index){
        List options=Provider.of<ActivityProvider>(context,listen: false).moodOptions[index];
        Map frequency=Provider.of<ActivityProvider>(context,listen: false).frequency;
        //final _myProvider=Provider.of<ActivityProvider>(context,listen: false);
          showModalBottomSheet<void>(
            //isDismissible: false,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return MoodBottomSheet(display: options,frequency: frequency,);
              //return ChangeNotifierProvider.value(value: _myProvider,child: MoodBottomSheet(display: options,));
              //BottomCustomSheet(index:widget.index);
            },

          );




    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Provider.of<ActivityProvider>(context,listen: false).setMood("😁");
              int k = 0;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              showOptions(k);
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[0] == 1 ? Color.fromRGBO(237,73,103, 1) : Color.fromRGBO(240,201,218,1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😁',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240,201,218,1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Good',
                  style: TextStyle(
                    color: tap[0] == 1 ? Color.fromRGBO(237,73,103, 1) : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              Provider.of<ActivityProvider>(context,listen: false).setMood("😃");
              int k = 1;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 2nd');
              showOptions(k);
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[1] == 1 ? Color.fromRGBO(237,73,103, 1) : Color.fromRGBO(240,201,218,1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😃',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240,201,218,1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Good',
                  style: TextStyle(
                    color: tap[1] == 1 ? Color.fromRGBO(237,73,103, 1) : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              Provider.of<ActivityProvider>(context,listen: false).setMood("🙂");
              int k = 2;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 3rd');
              showOptions(k);
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[2] == 1 ? Color.fromRGBO(237,73,103, 1): Color.fromRGBO(240,201,218,1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙂',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240,201,218,1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Neutral',
                  style: TextStyle(
                    color: tap[2] == 1 ? Color.fromRGBO(237,73,103, 1) : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              Provider.of<ActivityProvider>(context,listen: false).setMood("🙁");
              int k = 3;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 4th');
              showOptions(k);
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[3] == 1 ? Color.fromRGBO(237,73,103, 1) : Color.fromRGBO(240,201,218,1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙁',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240,201,218,1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Sad',
                  style: TextStyle(
                    color: tap[3] == 1 ? Color.fromRGBO(237,73,103, 1) : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              Provider.of<ActivityProvider>(context,listen: false).setMood("😞");
              int k = 4;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 5th');
              showOptions(k);
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[4] == 1 ? Color.fromRGBO(237,73,103, 1) : Color.fromRGBO(240,201,218,1),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😞',
                      style: TextStyle(fontSize: deviceHeight * 0.044),
                    ),
                    backgroundColor: Color.fromRGBO(240,201,218,1),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Sad',
                  style: TextStyle(
                    color: tap[4] == 1 ? Color.fromRGBO(237,73,103, 1) : Colors.black,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
