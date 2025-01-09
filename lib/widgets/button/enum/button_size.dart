import 'package:universal_flutter_utils/universal_flutter_utils.dart';

enum UFUButtonSize {
  small,
  medium,
  large
}

class UFUButtonSizeHelper {
  static double? getUFUButtonWeight(UFUButtonSize? buttonSize) {
    switch(buttonSize) {
      case UFUButtonSize.small:
        return 100;
      case UFUButtonSize.medium:
        return 250;
      case UFUButtonSize.large:
        return double.maxFinite;
      default:
        return double.maxFinite;
    }
  }

  static UFUTextSize? getUFUButtonTextSize(UFUButtonSize? buttonSize) {
    switch(buttonSize) {
      case UFUButtonSize.small:
        return UFUTextSize.medium;
      case UFUButtonSize.medium:
      case UFUButtonSize.large:
        return UFUTextSize.extraLarge;
      default:
        return UFUTextSize.extraLarge;
    }
  }

  static UFUTextWeight? getUFUButtonTextWeight(UFUButtonSize? buttonSize) {
    return UFUTextWeight.medium;
  }

  static double getUFUButtonTextPadding(UFUButtonSize? buttonSize) {
    switch(buttonSize) {
      case UFUButtonSize.small:
        return 10;
      case UFUButtonSize.medium:
      case UFUButtonSize.large:
        return 13;
      default:
        return 13;
    }
  }
}
