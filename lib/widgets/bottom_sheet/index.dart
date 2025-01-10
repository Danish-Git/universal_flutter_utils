import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

import 'controller.dart';

Future<UFUSingleSelectModel?> UFUBottomSheet ({required Widget Function(UFUBottomSheetController controller) childBuilder}) async {
  return await Get.bottomSheet(
    UFUBottomSheetView(childBuilder: childBuilder),
    backgroundColor: AppTheme.themeColor.backgroundColor,
    ignoreSafeArea: true,
    isScrollControlled: true,
  );
}

class UFUBottomSheetView extends StatelessWidget {
  const UFUBottomSheetView({
    super.key,
    this.title,
    required this.childBuilder,
    this.isDisabled = false,
    this.singleSelectController,
  });

  final String? title;
  final Widget Function(UFUBottomSheetController controller) childBuilder;
  final bool isDisabled;
  final UFUSingleSelectController? singleSelectController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UFUBottomSheetController>(
      global: false,
      init: UFUBottomSheetController(),
      builder: (controller) =>  PopScope(
        canPop: !isDisabled,
        child: Container(
          constraints: BoxConstraints(
            minHeight: 200, // Minimum height for the bottom sheet
            maxHeight: MediaQuery.of(context).size.height * 0.7, // Maximum height
          ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                    UFUIconButton(
                      onTap: () => Get.back(),
                      icon: Icons.close,
                      isDisabled: controller.isDisabled,
                    ),
                  ],
                ),
                childBuilder(controller)
              ],
            )
          ),
        ),
      ),
    );
  }
}
