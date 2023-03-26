import 'package:flutter/material.dart';

class DefaultElements {
  static const Color grey = Color.fromRGBO(118, 118, 119, 1);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const cardShadow = [
    BoxShadow(color: grey, spreadRadius: 1, blurRadius: 3, offset: Offset(0, 2))
  ];

  static ThemeData getTheme() {
    Map<String, double> fontSize = {"xs": 12, "s": 14, "m": 20, "l": 24};

    return ThemeData(
      primaryColor: black,
      fontFamily: 'AdihausDIN',
      appBarTheme: const AppBarTheme(
          backgroundColor: white,
          foregroundColor: black,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: black,
            fontFamily: 'AdihausDIN',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          actionsIconTheme: IconThemeData(color: black, size: 24)),
      tabBarTheme:
          const TabBarTheme(labelColor: black, unselectedLabelColor: grey),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: black,
            fontSize: fontSize['l'],
            fontWeight: FontWeight.bold,
            letterSpacing: 1.6),
        titleMedium: TextStyle(
            color: black,
            fontSize: fontSize['m'],
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4),
        titleSmall: TextStyle(
            color: black,
            fontSize: fontSize['s'],
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
        bodySmall:
            TextStyle(fontSize: fontSize['s'], fontWeight: FontWeight.normal),
        labelSmall: TextStyle(
            color: black,
            fontSize: fontSize['s'],
            fontWeight: FontWeight.normal,
            letterSpacing: 1.2
        ),
        labelMedium: TextStyle(
            color: black,
            fontSize: fontSize['m'],
            fontWeight: FontWeight.normal,
            letterSpacing: 1.4
        ),
      ),
    );
  }
}
