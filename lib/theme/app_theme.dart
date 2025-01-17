import 'package:universal_flutter_utils/theme/form_ui_helper.dart';
import 'package:universal_flutter_utils/theme/theme_colors.dart';
import 'package:universal_flutter_utils/theme/theme_model.dart';

class AppTheme {
  static ThemeModel themeData = ThemeModel(
    colors: ThemeColors.light(),
    formUiHelper: FormUiHelper(),
  );

  static void setTheme(bool isDark) {
    if (isDark) {
      themeData = ThemeModel(
          colors: ThemeColors.dark(),
          formUiHelper: FormUiHelper()
      );
    } else {
      themeData = ThemeModel(
          colors: ThemeColors.light(),
          formUiHelper: FormUiHelper()
      );
    }
  }

  static ThemeColors get themeColors {
    return themeData.colors;
  }

  static FormUiHelper get formUiHelper {
    return themeData.formUiHelper;
  }

  // Method to set custom colors for the app theme
  static void setThemeColors({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? inverse,
    Color? text,
    Color? secondaryText,
    Color? success,
    Color? warning,
    Color? dimGray,
    Color? darkGray,
    Color? lightBlue,
    Color? purple,
    Color? dimBlack,
    Color? appBarColor,
    Color? borderColor,
  }) {
    if (primary != null) themeData.colors.primary = primary;
    if (secondary != null) themeColor.secondary = secondary;
    if (tertiary != null) themeColor.tertiary = tertiary;
    if (inverse != null) themeColor.inverse = inverse;
    if (text != null) themeColor.text = text;
    if (secondaryText != null) themeColor.secondaryText = secondaryText;
    if (success != null) themeColor.success = success;
    if (warning != null) themeColor.warning = warning;
    if (dimGray != null) themeColor.dimGray = dimGray;
    if (darkGray != null) themeColor.darkGray = darkGray;
    if (lightBlue != null) themeColor.lightBlue = lightBlue;
    if (purple != null) themeColor.purple = purple;
    if (dimBlack != null) themeColor.dimBlack = dimBlack;
    if (appBarColor != null) themeColor.appBarColor = appBarColor;
    if (borderColor != null) themeColor.borderColor = borderColor;
  }
}
