import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'enum/button_size.dart';

class UFUButton extends StatelessWidget {

  const UFUButton({
    super.key,
    this.text = "Submit",
    this.onPressed,
    this.filledColor,
    this.isOutlined = false,
    this.isDisable = false,
    this.buttonSize = UFUButtonSize.large,
    this.borderRadius = 10,
  });

  final String text;
  final VoidCallback? onPressed;
  final UFUButtonSize buttonSize;
  final Color? filledColor;
  final bool isOutlined;
  final bool isDisable;
  final double borderRadius;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDisable ? AppTheme.themeColor.disabledColor
          : isOutlined ? AppTheme.themeColor.backgroundColor
          : filledColor ?? AppTheme.themeColor.primaryColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: isDisable ? null : onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: UFUButtonSizeHelper.getUFUButtonWeight(buttonSize),
          padding: EdgeInsets.symmetric(vertical: UFUButtonSizeHelper.getUFUButtonTextPadding(buttonSize)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: isOutlined ? Border.all(
              color: filledColor ?? AppTheme.themeColor.primaryColor,
              width: 2
            ) : null
          ),
          child: UFUText(
            text: text,
            color: isOutlined ? AppTheme.themeColor.primaryColor : AppTheme.themeColor.backgroundColor,
            textSize: UFUButtonSizeHelper.getUFUButtonTextSize(buttonSize),
            textWeight: UFUButtonSizeHelper.getUFUButtonTextWeight(buttonSize),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

