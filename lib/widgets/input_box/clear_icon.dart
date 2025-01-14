
import 'package:flutter/material.dart';
import 'package:jp_mobile_flutter_ui/jp_mobile_flutter_ui.dart';

class JPInputBoxClearIcon extends StatelessWidget {
  const JPInputBoxClearIcon({
    Key? key,
    this.cancelButtonColor,
    this.cancelButtonSize = 22,
    required this.type
  }) : super(key: key);

  final Color? cancelButtonColor;

  final double? cancelButtonSize;

  final JPInputBoxType type;

  @override
  Widget build(BuildContext context) {

    switch(type) {
      case JPInputBoxType.withLabelAndClearIcon:
        return Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: cancelButtonColor ?? JPAppTheme.themeColors.secondaryText
            )
          ),
          child: JPIcon(
            Icons.clear,
            size: 15,
            color: JPAppTheme.themeColors.secondary,
          ),
        );

      case JPInputBoxType.searchbarWithoutBorder:
        return JPIcon(
          Icons.cancel,
          color: cancelButtonColor ?? JPAppTheme.themeColors.secondaryText,
          size: cancelButtonSize,
        );

      default:
        return const SizedBox();
    }
  }
}
