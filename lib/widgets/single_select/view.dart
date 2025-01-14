import 'package:flutter/material.dart';
import 'package:jp_mobile_flutter_ui/AnimatedSpinKit/fading_circle.dart';
import 'package:jp_mobile_flutter_ui/jp_mobile_flutter_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class JPSingleSelectView extends StatelessWidget {
  const JPSingleSelectView({
    required this.list,
    required this.mainList,
    this.selectedItemId,
    this.scrollController,
    this.onSelect,
    this.title,
    this.onSearch,
    this.isVisible,
    this.searchInputCtrl,
    this.inputHintText,
    this.isFilterSheet = false,
    this.canShowIconButton = false,
    this.iconButtonBackgroundColor,
    this.iconButtonBorderRadius,
    this.onIconButtonTap,
    this.iconButtonIcon,
    this.iconButtonIconSize,
    this.iconButtonIconColor,
    this.iconButtonIconWidget,
    this.suffixButtonText,
    this.prefixButtonText,
    this.onTapSuffixBtn,
    this.onTapPrefixBtn,
    this.type = JPSingleSelectType.local,
    this.isLoading = false,
    this.isLoadMore = false,
    this.listLoader,
    this.canShowLoadMore = false,
    this.canShowSearchBar,
    this.showIncludeInactiveButton = false,
    this.includeInactive = false,
    this.onTapIncludeInactiveButton,
    Key? key,
  }) : super(key: key);

  final List<JPSingleSelectModel> list;

  final List<JPSingleSelectModel> mainList;

  //Selected item id from the list
  final String? selectedItemId;

  final ValueChanged<String>? onSelect;

  //Single select header title
  final String? title;

  final bool? isVisible;

  final ValueChanged<String>? onSearch;

  final TextEditingController? searchInputCtrl;

  final AutoScrollController? scrollController;

  //For showing single select as filter - Pass true to make it as fiter
  //This will add extra padding from bottom and change draggable scroll behaviour
  final bool isFilterSheet;

  //Placeholder of searchbox
  final String? inputHintText;

  ///   Icon Button Params
  final bool canShowIconButton;
  final Color? iconButtonBackgroundColor;
  final double? iconButtonBorderRadius;
  final VoidCallback? onIconButtonTap;
  final IconData? iconButtonIcon;
  final double? iconButtonIconSize;
  final Color? iconButtonIconColor;
  final Widget? iconButtonIconWidget;

  final String? suffixButtonText;
  final String? prefixButtonText;

  final VoidCallback? onTapSuffixBtn;
  final VoidCallback? onTapPrefixBtn;
  final VoidCallback? onTapIncludeInactiveButton;

  /// type can be used to differentiate between network list and local list
  /// default selected type is [JPSingleSelectType.local]
  final JPSingleSelectType type;

  /// In case of network list isLoading helps to manage loading state
  final bool isLoading;

  /// In case of network list isLoading helps to manage load more state
  final bool isLoadMore;

  /// In case of network list listLoader is used to display a loading placeholder
  final Widget? listLoader;

  /// In case of network list canShowMore helps to manage loader state
  final bool canShowLoadMore;

  /// In case of network list canShowMore helps to manage search state
  final bool? canShowSearchBar;

  /// For showing include inactive button
  final bool showIncludeInactiveButton;

  /// For change include inactive state
  final bool includeInactive;

  @override
  Widget build(BuildContext context) {
    return getView(context, scrollController);
  }

  Widget getView(BuildContext context, AutoScrollController? scrollController) {
    double getMaxHeight() {
      if(MediaQuery.of(context).viewInsets.bottom > 0) {
        return MediaQuery.of(context).size.height * 0.4;
      } else {
        return MediaQuery.of(context).size.height * 0.60;
      }
    }

    return SafeArea(
      bottom: isFilterSheet,
      child: AnimatedPadding(
          duration: const Duration(milliseconds: 100),
          padding: JPResponsiveDesign.popOverBottomInsets,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10,
              bottom: isFilterSheet && !JPScreen.hasBottomPadding ? 20 : 0),
            child: ClipRRect(
              borderRadius: getBorderRadius(),
              child: Material(
                borderRadius: getBorderRadius(),
                color: JPAppTheme.themeColors.base,
                child: SafeArea(
                  top: false,
                  bottom: !isFilterSheet,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      JPSingleSelectHeader(
                        canShowSearchBar: canShowSearchBar ?? ((type == JPSingleSelectType.network || !isFilterSheet) && mainList.length > 10),
                        title: title!,
                        inputHintText: inputHintText,
                        searchInputCtrl: searchInputCtrl,
                        onSearch: onSearch,
                        canShowIconButton: canShowIconButton,
                        iconButtonBackgroundColor: iconButtonBackgroundColor,
                        iconButtonBorderRadius: iconButtonBorderRadius,
                        onIconButtonTap: onIconButtonTap,
                        iconButtonIcon: iconButtonIcon,
                        iconButtonIconColor: iconButtonIconColor,
                        iconButtonIconSize: iconButtonIconSize,
                        iconButtonIconWidget: iconButtonIconWidget,
                        showIncludeInactiveButton: showIncludeInactiveButton,
                        onTapIncludeInactiveButton: onTapIncludeInactiveButton,
                        includeInactive: includeInactive,
                      ),

                      Flexible(
                        child: Stack(
                          children: [
                            if (!isVisible!)
                              SizedBox(
                                  height: getMaxHeight(),
                                  child: Center(
                                      child: FadingCircle(
                                    color: JPAppTheme.themeColors.primary,
                                    size: 30,
                                  ))),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              constraints: BoxConstraints(maxHeight: getMaxHeight()),
                              child: Opacity(
                                opacity: isVisible! ? 1 : 0,
                                child: JPSingleSelectList(
                                  scrollController: scrollController!,
                                  list: list,
                                  selectedItemId: selectedItemId,
                                  onSelect: onSelect,
                                  type: type,
                                  canShowLoadMore: canShowLoadMore,
                                  isLoading: isLoading,
                                  isLoadMore: isLoadMore,
                                  listLoader: listLoader,
                                  showInActiveUserLabel: showIncludeInactiveButton,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            if (prefixButtonText != null)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: JPButton(
                                    text: prefixButtonText?.toUpperCase(),
                                    colorType: JPButtonColorType.lightGray,
                                    size: JPButtonSize.small,
                                    onPressed: onTapPrefixBtn,
                                  ),
                                ),
                              ),
                            if (suffixButtonText != null) ...{
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: JPButton(
                                    text: suffixButtonText?.toUpperCase(),
                                    colorType: JPButtonColorType.tertiary,
                                    size: JPButtonSize.small,
                                    onPressed: onTapSuffixBtn,
                                  ),
                                ),
                              ),
                            },
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }

  BorderRadius getBorderRadius() {
    if(isFilterSheet) {
      return BorderRadius.circular(20);
    } else {
      return JPResponsiveDesign.bottomSheetRadius;
    }
  }

}
