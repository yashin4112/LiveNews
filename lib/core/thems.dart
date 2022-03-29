import 'package:flutter/material.dart';

class Themes {

  static var primaryColor = Colors.blueGrey;

  static var lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    ),
    primaryColor: primaryColor,
    accentColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.blueGrey.shade200,
      selectedItemColor: Colors.blueGrey.shade700,
    ),
    splashColor: primaryColor.withAlpha(50),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(primaryColor)
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(primaryColor),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:  MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    iconTheme: IconThemeData(
      color: Colors.black
    ),
    indicatorColor: Colors.black,
    
  );

  static var darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: primaryColor,
    ),
    primaryColor: primaryColor,
    accentColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor
    ),
    splashColor: primaryColor.withAlpha(25),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(primaryColor)
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(primaryColor),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:  MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all<Color>(primaryColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
    indicatorColor: Colors.grey[200],
  );

}