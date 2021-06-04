import 'package:flutter/material.dart';

class AdvSett extends StatefulWidget {
  final double w;

  AdvSett(this.w);

  @override
  _AdvSettState createState() => _AdvSettState();
}

class _AdvSettState extends State<AdvSett> {
  bool noti = true;
  bool sleep = true;
  bool water = true;
  bool exercise = true;
  Widget _buildSwitchListTile(
      String title,
      bool currentValue,
      Function updateValue,
      ) {
    return SwitchListTile(
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
      value: currentValue,
      subtitle: Text("Enable/Disable",style: TextStyle(fontSize: 14),
      ),
      onChanged: updateValue,
      activeColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: widget.w),
      shrinkWrap: true,
      children: [
        _buildSwitchListTile("Notifications", noti, (val){ setState(() {
          noti = val;
        });}),
        _buildSwitchListTile("Sleep Tracker", sleep, (val){ setState(() {
          sleep = val;
        });}),
        _buildSwitchListTile("Water Tracker", water, (val){ setState(() {
          water = val;
        });}),
        _buildSwitchListTile("Exercise Tracker", exercise, (val){ setState(() {
          exercise = val;
        });}),
      ],
    );
  }
}
