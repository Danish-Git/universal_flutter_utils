import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UFUIconButton extends StatelessWidget {
  const UFUIconButton({
    super.key,
    this.borderRadius = 10,
    this.buttonType = UFUIconButtonType.unfilled,
    this.backgroundColor,
    this.iconWidget,
    this.icon,
    this.iconColor,
    this.iconSize = 24,
    this.onTap,
    this.isDisabled = false,
  });

  final double? borderRadius;
  final UFUIconButtonType? buttonType;
  final Color? backgroundColor;
  final Widget? iconWidget;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final VoidCallback? onTap;
  final bool? isDisabled;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: UFUIconButtonTypeHelper.getBackgroundColor(buttonType, backgroundColor, isDisabled),
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: InkWell(
        onTap: isDisabled ?? false ? null : onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: buttonType == UFUIconButtonType.outlined ? BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(
              color: isDisabled ?? false ? AppTheme.themeColor.disabledColor : backgroundColor ?? AppTheme.themeColor.primaryColor,
              width: 2
            )
          ) : null,
          child: iconWidget ?? Icon(
            icon ?? Icons.add,
            color: UFUIconButtonTypeHelper.getIconColor(buttonType, iconColor, isDisabled),
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
