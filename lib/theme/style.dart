import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xffFf5c04),
    bottomAppBarColor: Colors.white,
    accentColor: Colors.orange,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    scaffoldBackgroundColor: Color(0xff121212),
    canvasColor: Color(0xff121212),
    fontFamily: 'OpenSans',
    textTheme: Typography(platform: TargetPlatform.iOS).white,
    primaryTextTheme: Typography(platform: TargetPlatform.iOS).white,
  );
}