import 'package:flutter/material.dart';

class MyCustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
  );

  static const Color buttonColorPink = Color.fromARGB(255, 220, 65, 169);
  static const Color textColorPink = Color.fromARGB(255, 220, 65, 169);
  static const Color appBarColor = Color.fromARGB(255, 220, 65, 169);
  static const BorderSide borderSideColor =
      BorderSide(color: Color.fromARGB(255, 220, 65, 169));

  static const TextStyle textStyleTitle = TextStyle(
      color: Color.fromARGB(255, 220, 65, 169),
      fontWeight: FontWeight.w700,
      fontSize: 30);

  static const TextStyle textStyleTextButton = TextStyle(
      color: Color.fromARGB(255, 220, 65, 169),
      fontWeight: FontWeight.normal,
      fontSize: 10);

  static const EdgeInsetsGeometry marginTop = EdgeInsets.only(top: 10);
}
