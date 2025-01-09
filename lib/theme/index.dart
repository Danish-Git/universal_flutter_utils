import 'package:flutter/material.dart';

import 'color.dart';

// Define the ThemeColor class to hold color constants

class AppTheme {

  static UFUThemeColor themeColor = UFUThemeColor();

  // Theme mode logic
  static bool isDarkMode = false; // Track whether the app is in dark mode

  // Define the application theme using ThemeData
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: themeColor.primaryColor,
        secondary: themeColor.secondaryColor, // Replaced accentColor with secondary
      ),
      scaffoldBackgroundColor: themeColor.backgroundColor, // Apply background color for scaffold
      buttonTheme: ButtonThemeData(
        buttonColor: themeColor.buttonColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: themeColor.appBarColor,
        iconTheme: IconThemeData(color: themeColor.textColor),
      ),
    );
  }

  // Dark theme configuration
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: themeColor.primaryColor,
        secondary: themeColor.secondaryColor, // Replaced accentColor with secondary
      ),
      scaffoldBackgroundColor: themeColor.backgroundColor, // Apply background color for scaffold
      buttonTheme: ButtonThemeData(
        buttonColor: themeColor.buttonColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: themeColor.appBarColor,
        iconTheme: IconThemeData(color: themeColor.textColor),
      ),
    );
  }

  // Method to switch between light and dark themes
  static void toggleTheme() {
    isDarkMode = !isDarkMode;
  }

  // Method to set custom colors for the app theme
  static void setThemeColors({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? buttonColor,
    Color? textColor,
    Color? appBarColor,
    Color? borderColor,
  }) {
    if (primaryColor != null) themeColor.primaryColor = primaryColor;
    if (secondaryColor != null) themeColor.secondaryColor = secondaryColor;
    if (backgroundColor != null) themeColor.backgroundColor = backgroundColor;
    if (buttonColor != null) themeColor.buttonColor = buttonColor;
    if (textColor != null) themeColor.textColor = textColor;
    if (appBarColor != null) themeColor.appBarColor = appBarColor;
    if (borderColor != null) themeColor.borderColor = borderColor;
  }

  // Return the appropriate theme based on the current mode (dark or light)
  static ThemeData get currentTheme {
    return isDarkMode ? darkTheme() : lightTheme();
  }
}
