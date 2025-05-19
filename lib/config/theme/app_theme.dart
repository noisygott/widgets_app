import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.deepPurple,
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
    : assert(selectColor >= 0, 'Select color must be greater then 0'),
      assert( selectColor <= colorList.length - 1,'Select color must be less or equal than ${colorList.length - 1}',
  );

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorList[selectColor]);
}
