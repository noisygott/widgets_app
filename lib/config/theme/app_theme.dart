import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.deepPurple,
];

const List<String> colorsName = [
  'Azul',
  'Rojo',
  'Verde',
  'Morado'
];
class AppTheme {
  final int selectColor;
  final bool isDarkMode;

  AppTheme({
    this.selectColor = 0,
    this.isDarkMode = false
    
  })
    : assert(selectColor >= 0, 'Select color must be greater then 0'),
      assert( selectColor <= colorList.length - 1,'Select color must be less or equal than ${colorList.length - 1}',
  );

  ThemeData getTheme() =>ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  AppTheme copyWith({
    int? selectColor,
    bool? isDarkMode
  }) => AppTheme(
    selectColor: selectColor ?? this.selectColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}

