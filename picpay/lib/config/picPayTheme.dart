import 'package:flutter/material.dart';

ThemeData picPayTheme() {
  final ThemeData base = ThemeData();

  return base.copyWith(
    primaryColor: Color(0XFF1D4384),
    indicatorColor: Color(0xFF022062),
    hintColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: new TextStyle(color: Colors.white),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}