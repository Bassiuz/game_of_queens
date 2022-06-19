import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color translucentBlack = Color.fromARGB(100, 0, 0, 0);

  static const double menuPadding = 24.0;

  static TextStyle titleStyle = const TextStyle(
    fontFamily: 'RainyHearts',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle subTitleStyle = const TextStyle(
    fontFamily: 'RainyHearts',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle textStyle = const TextStyle(
    fontFamily: 'RainyHearts',
    color: Colors.white,
  );
}
