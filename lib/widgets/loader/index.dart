
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

ShowUFULoader({String? msg}) {
  Get.generalDialog(
    barrierDismissible: false,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: UFUtils.transitionDuration),
    transitionBuilder: (context, _animation, _secondaryAnimation, _child) {
      return Animations.grow(_animation, _secondaryAnimation, _child);
    },
    pageBuilder: (_animation, _secondaryAnimation, _child) {
      return UFULoader(
        text: msg,
      );
    },
  );
}

/// showUFUConfirmationLoader can be used to show loading animation on buttons
/// parameters: show[optional]
/// show:- it is a bool variable which can be used to show or hide loader
///        default value is [false]
Widget? showUFUConfirmationLoader({bool? show = false, double size = 20}){
  return show!
      ? SpinKitThreeBounce(color: UFUColor.white, size: size)
      : null;
}


class UFULoader extends StatelessWidget {
  const UFULoader({
    Key? key,
    this.text,
  }) : super(key: key);

  /// It is used to set loader text
  final String? text;

  @override
  Widget build(BuildContext context) {
    UFUtils.isLoading = true;
    return CustomDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadingCircle(color: AppTheme.themeColors.primary, size: 40),
          const SizedBox(
            height: 5,
          ),
          if(text != null)
            UFUText(
              text: text!,
              textSize: UFUTextSize.heading5,
              textColor: AppTheme.themeColors.tertiary,
            ),
        ],
      ),
    );
  }
}