import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UFUBottomSheet extends StatelessWidget {
  const UFUBottomSheet({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.themeColor.backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15)
        )
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UFUText(
                  text: title ?? UFUtils.appName,
                  color: AppTheme.themeColor.primaryColor,
                  textSize: UFUTextSize.large,
                  textWeight: UFUTextWeight.medium,
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: AppTheme.themeColor.primaryColor, size: 24,))
              ],
            ),
          ],
        )
      ),
    );
  }
}
