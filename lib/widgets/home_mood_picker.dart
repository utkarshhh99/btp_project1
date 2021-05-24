import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              int k = 0;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 1st');
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[0] == 1 ? Colors.pink[500] : Color(0xFFff80b3),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😁',
                      style: TextStyle(fontSize: deviceHeight * 0.05),
                    ),
                    backgroundColor: Color(0xFFff80b3),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Good',
                  style: TextStyle(
                    color: tap[0] == 1 ? Colors.pink[500] : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              int k = 1;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 2nd');
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[1] == 1 ? Colors.pink[500] : Color(0xFFff80b3),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😃',
                      style: TextStyle(fontSize: deviceHeight * 0.05),
                    ),
                    backgroundColor: Color(0xFFff80b3),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Good',
                  style: TextStyle(
                    color: tap[1] == 1 ? Colors.pink[500] : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              int k = 2;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 3rd');
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[2] == 1 ? Colors.pink[500]: Color(0xFFff80b3),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙂',
                      style: TextStyle(fontSize: deviceHeight * 0.05),
                    ),
                    backgroundColor: Color(0xFFff80b3),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Neutral',
                  style: TextStyle(
                    color: tap[2] == 1 ? Colors.pink[500] : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              int k = 3;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }

              print('tapped in 4th');
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[3] == 1 ? Colors.pink[500] : Color(0xFFff80b3),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '🙁',
                      style: TextStyle(fontSize: deviceHeight * 0.05),
                    ),
                    backgroundColor: Color(0xFFff80b3),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Sad',
                  style: TextStyle(
                    color: tap[3] == 1 ? Colors.pink[500] : Colors.black,
                  ),
                ),
              ],
            )),
        SizedBox(width: deviceWidth * 0.04),
        GestureDetector(
            onTap: () {
              int k = 4;
              tap[k] = 1 ^ tap[k];
              for (int i = 0; i < 5; i++) {
                if (i != k) tap[i] = 0;
              }
              print('tapped in 5th');
              setState(() {});
            },
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor:
                      tap[4] == 1 ? Colors.pink[500] : Color(0xFFff80b3),
                  radius: outerRadius,
                  child: CircleAvatar(
                    child: Text(
                      '😞',
                      style: TextStyle(fontSize: deviceHeight * 0.05),
                    ),
                    backgroundColor: Color(0xFFff80b3),
                    radius: innerRadius,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Very Sad',
                  style: TextStyle(
                    color: tap[4] == 1 ? Colors.pink[500] : Colors.black,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
