import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

enum UFUIconButtonType {
  filled,
  unfilled,
  outlined,
}

class UFUIconButtonTypeHelper {
  static Color getBackgroundColor(UFUIconButtonType? buttonType, Color? backgroundColor, bool? isDisabled) {
    switch(buttonType) {
      case UFUIconButtonType.filled:
        return isDisabled ?? false ? AppTheme.themeColor.disabledColor: backgroundColor ?? AppTheme.themeColor.primaryColor;
      case UFUIconButtonType.unfilled:
      case UFUIconButtonType.outlined:
        return AppTheme.themeColor.transparent;
      default:
        return AppTheme.themeColor.transparent;
    }
  }
  static Color getIconColor(UFUIconButtonType? buttonType, Color? iconColor, bool? isDisabled) {

    switch(buttonType) {
      case UFUIconButtonType.filled:
        return iconColor ?? AppTheme.themeColor.backgroundColor;
      case UFUIconButtonType.unfilled:
      case UFUIconButtonType.outlined:
        return isDisabled ?? false ? AppTheme.themeColor.disabledColor : iconColor ?? AppTheme.themeColor.primaryColor;
      default:
        return AppTheme.themeColor.primaryColor;
    }
  }
}
