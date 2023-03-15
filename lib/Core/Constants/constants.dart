import 'package:flutter/material.dart';

class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);
}

const kTtextfieldDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.red, fontSize: 10),
  contentPadding: EdgeInsets.all(10),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.white),
  ),
  errorMaxLines: 1,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 2, color: Colors.red),
  ),
);
