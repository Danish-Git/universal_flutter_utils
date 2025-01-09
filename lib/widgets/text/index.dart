import 'package:flutter/material.dart';

import '../../theme/index.dart';
import 'enum/text_size.dart';
import 'enum/text_weight.dart';

class UFUText extends StatelessWidget {
  const UFUText({
    super.key,
    required this.text,
    this.maxLines,
    this.textAlign = TextAlign.left,
    this.color,
    this.overflow = TextOverflow.ellipsis,
    this.textWeight = UFUTextWeight.normal,
    this.textSize = UFUTextSize.medium,
    this.isUnderline = false,
    this.isItalic = false,
  });

  final String text;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;
  final UFUTextWeight? textWeight;
  final UFUTextSize? textSize;
  final bool isUnderline;
  final bool isItalic;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      textScaler: const TextScaler.linear(1),
      style: TextStyle(
        color: color ?? AppTheme.themeColor.textColor,
        fontWeight: UFUTextWeightHelper.getFontWeight(textWeight),
        fontSize: UFUTextSizeHelper.getFontSize(textSize),
        overflow: overflow,
        decoration: isUnderline ? TextDecoration.underline : TextDecoration.none, // Apply underline
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal, // Apply italic
      ),
    );
  }
}

