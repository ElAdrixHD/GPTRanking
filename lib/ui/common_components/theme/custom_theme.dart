import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 2,
    toolbarHeight: 56,
    surfaceTintColor: Colors.transparent,
    color: Colors.indigo[100],
  ),
  primaryColor: Colors.indigo[100],
  scaffoldBackgroundColor: Colors.grey[200],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    disabledElevation: 0,
    elevation: 2,
    iconSize: 20,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 10,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.indigo[200] ?? Colors.indigo,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),
  ),
);
