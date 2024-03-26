import 'package:flutter/material.dart';

class MyCustomTheme {
  static const Color primaryColor = Color(0xFF39A552);
  static const Color secondaryColor = Color(0xFF4F5A69);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(fontSize: 22, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: whiteColor),
      bodyLarge: TextStyle(fontSize: 22, color: secondaryColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
