import 'package:flutter/material.dart';
class Activity {

   Activity({this.title, this.icon, this.unit, this.value,this.modalText});
  final String title;
  final Icon icon;
  int value;
  final String unit;
  final String modalText;
}