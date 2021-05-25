import 'package:flutter/material.dart';
import '../models/activity_unit.dart';

class ActivityProvider extends ChangeNotifier{
  // Activity({this.title, this.icon, this.unit, this.value,this.modalText});
  // final String title;
  // final Icon icon;
  // final int value;
  // final String unit;
  // final String modalText;
  String _mood = "";
  List<Activity> _activities = <Activity>[
  Activity(
    title: 'Sleep',
    icon: Icon(
      Icons.nightlight_round,
      color: Colors.yellow,
    ),
    value: 0,
    unit: 'hours',
    modalText: 'How many hours did you sleep today?',
  ),
  Activity(
    title: 'Workout',
    icon: Icon(
      Icons.face,
      color: Colors.yellow,
    ),
    value: 0,
    unit: 'hours',
    modalText: 'How many hours did you workout today?',
  ),
  Activity(
    title: 'Water',
    icon: Icon(
      Icons.water_damage,
      color: Colors.yellow,
    ),
    value: 0,
    unit: 'bottles',
    modalText: 'How many bottles of water did you drink today?'
  ),
];

List<Activity> get activities =>_activities;

void setValue(int index,int amount){
  _activities[index].value=amount;
  notifyListeners();
}
void setMood(String m){
  _mood=m;
  notifyListeners();
}
String getMood(){
  return _mood;
}


}