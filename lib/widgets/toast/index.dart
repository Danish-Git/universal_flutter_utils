
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UFUToast{
  static showToast(String message, {String? title}) {
    Get.snackbar(
        title ?? UFUtils.appName, message,
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: UFUText(
          text: title ?? UFUtils.appName,
          textSize: UFUTextSize.large,
          textWeight: UFUTextWeight.bold,
        ),
        messageText: UFUText(
          text: message,
          textWeight: UFUTextWeight.normal,
          textSize: UFUTextSize.medium,
          maxLines: 5,
        ),
        margin: EdgeInsets.fromLTRB(15, 0, 15, MediaQuery.of(Get.context!).padding.bottom + 16),
        borderRadius: 8,
        snackStyle: SnackStyle.GROUNDED,
        boxShadows: [
          BoxShadow(
            color: AppTheme.themeColor.dimGrayColor,
            spreadRadius: 2,
          ),
        ],
        borderColor: AppTheme.themeColor.primaryColor,
        borderWidth: 3
    );
  }
}