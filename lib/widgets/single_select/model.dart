import 'package:flutter/material.dart';
import 'package:jp_mobile_flutter_ui/jp_mobile_flutter_ui.dart';
class JPSingleSelectModel {
  String label;
  String subLabel;
  String id;
  Widget? child;
  Color? color;
  Color? borderColor;
  double? borderWidth;
  Widget? suffix;
  VoidCallback? onTapItem;
  dynamic additionalData;
  String? prefixLabel;
  bool? isEditable;
  bool? active;
  JPInputBoxController? labelController;

  JPSingleSelectModel({
    required this.label,
    required this.id,
    this.child,
    this.color,
    this.borderColor,
    this.borderWidth,
    this.suffix,
    this.onTapItem,
    this.additionalData,
    this.prefixLabel,
    this.subLabel = '',
    this.labelController,
    this.isEditable = false,
    this.active = true
  });

  factory JPSingleSelectModel.clone(JPSingleSelectModel source) {
    return JPSingleSelectModel(
      id: source.id,
      label: source.label,
      color: source.color,
      child: source.child,
      borderColor: source.borderColor,
      borderWidth: source.borderWidth,
      onTapItem: source.onTapItem,
      prefixLabel: source.prefixLabel,
      subLabel: source.subLabel,
      suffix: source.suffix,
      additionalData: source.additionalData,
      isEditable: source.isEditable,
      labelController: JPInputBoxController(text: source.label),
      active: source.active
    );
  }

}
