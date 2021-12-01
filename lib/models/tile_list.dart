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
List<List<String>> get moodOptions =>_moodOptions;
List<List<String>> _moodOptions =[
  [
    'Had fun with loved ones',
    'Had a good day at work/school',
    'Accomplished a goal',
  ],
  [
    'Spent time with loved ones',
    'Did something I enjoy',
    'Ate something you like',
  ],
  [
    'Spent day being too busy',
    'Followed normal routine',
    'Met new people',
  ],
  [
    'Couldn\'t finish a scheduled task',
    'Missed an event',
    'Missing a loved one', 
  ],
  [
    'Fell sick',
    'Had a fight with a loved one',
    'Things didn\'t go well at work',
  ]
];

Map<String,int> frequency = {
  'Had fun with loved ones':0,
  'Had a good day at work':0,
  'Accomplished a goal':0,
  'Spent time with loved ones':0,
  'Did something I enjoy':0,
  'Ate something you like':0,
  'Spent day being too busy':0,
  'Followed normal routine':0,
  'Met new people':0,
  'Couldn\'t finish a scheduled task':0,
  'Missed an event':0,
  'Missing a loved one':0,
  'Fell sick':0,
  'Had a fight with a loved one':0,
  'Things didn\'t go well at work':0,
};

// Map<String,int> get frequency => _frequency;
// void incValue(String s){
//   _frequency[s]++;
//   notifyListeners();
// }
// void decValue(String s){
//   _frequency[s]--;
//   notifyListeners();
// }


}