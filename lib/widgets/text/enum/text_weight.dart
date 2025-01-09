import 'package:flutter/material.dart';

enum UFUTextWeight {
  normal,
  medium,
  bold
}

class UFUTextWeightHelper {
  static FontWeight getFontWeight(UFUTextWeight? textWeight) {
    switch (textWeight) {
      case UFUTextWeight.normal:
        return FontWeight.w400;
      case UFUTextWeight.medium:
        return FontWeight.w600;
      case UFUTextWeight.bold:
        return FontWeight.w800;
      default:
        return FontWeight.w400;
    }
  }
}