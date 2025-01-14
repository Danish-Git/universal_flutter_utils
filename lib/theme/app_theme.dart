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
// static void setThemeColors({
//   Color? primaryColor,
//   Color? secondaryColor,
//   Color? backgroundColor,
//   Color? buttonColor,
//   Color? textColor,
//   Color? appBarColor,
//   Color? borderColor,
// }) {
//   if (primaryColor != null) themeColor.primaryColor = primaryColor;
//   if (secondaryColor != null) themeColor.secondaryColor = secondaryColor;
//   if (backgroundColor != null) themeColor.backgroundColor = backgroundColor;
//   if (buttonColor != null) themeColor.buttonColor = buttonColor;
//   if (textColor != null) themeColor.textColor = textColor;
//   if (appBarColor != null) themeColor.appBarColor = appBarColor;
//   if (borderColor != null) themeColor.borderColor = borderColor;
// }
}
