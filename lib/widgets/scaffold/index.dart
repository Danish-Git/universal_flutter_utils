import 'package:flutter/material.dart';
import 'package:universal_flutter_utils/theme/app_theme.dart';
import 'package:universal_flutter_utils/universal_flutter_utils.dart';

class UFUScaffold extends StatelessWidget {
  const UFUScaffold({
    super.key,
    this.appBar,
    this.drawer,
    this.body,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? body;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UFUtils.commonMethods.hideKeyboard(),
      child: Scaffold(
        backgroundColor: AppTheme.themeColors.base,
        appBar: appBar,
        drawer: drawer,
        body: body,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
