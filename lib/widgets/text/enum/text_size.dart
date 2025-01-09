enum UFUTextSize {
  extraSmall,
  small,
  medium,
  large,
  extraLarge,
  superLarge,
}

class UFUTextSizeHelper {
  static double getFontSize(UFUTextSize? textSize) {
    switch (textSize) {
      case UFUTextSize.extraSmall:
        return 11;
      case UFUTextSize.small:
        return 12;
      case UFUTextSize.medium:
        return 14;
      case UFUTextSize.large:
        return 16;
      case UFUTextSize.extraLarge:
        return 18;
      case UFUTextSize.superLarge:
        return 20;
      default:
        return 14;
    }
  }
}