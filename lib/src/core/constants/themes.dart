import 'package:flutter/material.dart';
import 'package:snapkeep/src/core/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kWhiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor,
    foregroundColor: kWhiteColor,
  ),
  colorScheme: const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kLightPrimaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: kPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),
  useMaterial3: true,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kDarkColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kLightPrimaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: kPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),
  useMaterial3: true,
);
