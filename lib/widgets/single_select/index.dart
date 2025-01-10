import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';
import 'package:universal_flutter_utils/widgets/bottom_sheet/controller.dart';
import 'package:universal_flutter_utils/widgets/bottom_sheet/index.dart';

Future<UFUSingleSelectModel?> UFUSingleSelect ({List<UFUSingleSelectModel>? dataList}) async {
  return await Get.bottomSheet(
    UFUBottomSheetView(childBuilder: (controller) => SingleSelectView(
      bottomSheetController: controller,
      dataList: dataList,
    )),
    backgroundColor: AppTheme.themeColor.backgroundColor,
    ignoreSafeArea: true,
    isScrollControlled: true,
  );
}

class SingleSelectView extends StatelessWidget {
  const SingleSelectView({
    super.key,
    this.dataList,
    required this.bottomSheetController,
  });

  final UFUBottomSheetController bottomSheetController;
  final List<UFUSingleSelectModel>? dataList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UFUSingleSelectController>(
      global: false,
      init: UFUSingleSelectController(bottomSheetController : bottomSheetController, dataList: dataList),
      builder: (controller) => Flexible(
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: controller.dataList?.length ?? 0,
          itemBuilder: (context, index) => Material(
            color: AppTheme.themeColor.transparent,
            child: InkWell(
              onTap: () => Get.back(result: controller.dataList?[index]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UFUText(text: controller.dataList?[index].label ?? ""),
                    if(controller.dataList?[index].isSelected ?? false)
                    UFUIconButton(icon: Icons.check, iconColor: AppTheme.themeColor.primaryColor)
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
