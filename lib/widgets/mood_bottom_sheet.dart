import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MoodBottomSheet extends StatefulWidget {
  final List<String> display;
  Map<String, int> frequency;
  MoodBottomSheet({this.display, this.frequency});

  @override
  _MoodBottomSheetState createState() => _MoodBottomSheetState();
}

class _MoodBottomSheetState extends State<MoodBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * 0.65,
      //color: Colors.black,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(deviceWidth * 0.075),
          topRight: Radius.circular(deviceWidth * 0.075),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Choose the most appropriate reason :",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.pink)),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          ListView.builder(
            itemBuilder: (ctx, i) => MoodItem(widget.display[i],widget.frequency),
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(
                deviceWidth * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  deviceWidth * 0.014,
                ),
                color: Color.fromRGBO(237, 73, 103, 1),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                    fontSize: deviceHeight * 0.035, color: Colors.white),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MoodItem extends StatefulWidget {
  final String display;
  Map<String, int> frequency;
  MoodItem(this.display,this.frequency);

  @override
  State<MoodItem> createState() => _MoodItemState();
}

class _MoodItemState extends State<MoodItem> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    
    return CheckboxListTile(
      title: Text(
        widget.display,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
      ),
      value: _value,
      onChanged: (bool value) {
        setState(() {
          if(value==true){
            widget.frequency[widget.display]++;
          }
          else{
            widget.frequency[widget.display]--;
          }
          _value = value;
          print(widget.display);
          print(widget.frequency[widget.display]);
          //can add frequency increase/decrease logic here (will need index and exact mood)
        });
      },
      activeColor: Colors.pink,
    );
  }
}
