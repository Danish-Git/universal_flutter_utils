import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';
import 'package:universal_flutter_utils/widgets/bottom_sheet/index.dart';

UFUSingleSelect () async {
  await Get.bottomSheet(
    const UFUBottomSheet(child: SingleSelectView()),
    backgroundColor: AppTheme.themeColor.backgroundColor,
    ignoreSafeArea: true,
  );
}

class SingleSelectView extends StatelessWidget {
  const SingleSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
