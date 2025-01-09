import 'package:flutter/material.dart';

class UFUThemeColor {
  Color primaryColor;
  Color secondaryColor;
  Color backgroundColor;
  Color buttonColor;
  Color textColor;
  Color appBarColor;
  Color borderColor;
  Color disabledColor;
  Color dimGrayColor;

  // Constructor
  UFUThemeColor({
    this.primaryColor = const Color(0xFF6200EE), // Default purple color
    this.secondaryColor = const Color(0xFF03DAC6),  // Default teal color
    this.backgroundColor = const Color(0xFFF5F5F5), // Default light grey
    this.buttonColor = const Color(0xFF03A9F4), // Default blue color
    this.textColor = Colors.black, // Default text color
    Color? appBarColor, // Allow optional appBarColor in the constructor
    this.borderColor = Colors.blue, // Default border color for outline buttons
    this.disabledColor = Colors.grey, // Default disable color for buttons
    this.dimGrayColor = const Color(0xFFEDEDED), // Default background color for toast
  }) : appBarColor = appBarColor ?? primaryColor; // Set appBarColor to primaryColor by default
}