import 'package:flutter/material.dart';
import 'package:jp_mobile_flutter_ui/AnimatedSpinKit/fading_circle.dart';
import 'package:jp_mobile_flutter_ui/jp_mobile_flutter_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class JPSingleSelectList extends StatelessWidget {
  const JPSingleSelectList({
    required this.list,
    this.scrollController,
    this.selectedItemId,
    this.onSelect,
    this.type = JPSingleSelectType.local,
    this.isLoading = false,
    this.isLoadMore = false,
    this.listLoader,
    this.canShowLoadMore = false,
    this.showInActiveUserLabel = false,
      Key? key})
      : super(key: key);

  //List which renders
  final List<JPSingleSelectModel> list;

  //Selected item id from the list
  final String? selectedItemId;

  final ValueChanged<String>? onSelect;

  final AutoScrollController? scrollController;

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

  /// To show inactive users label in the list view
  final bool showInActiveUserLabel;

  @override
  Widget build(BuildContext context) {

    if(type == JPSingleSelectType.network && isLoading) {
      return SizedBox(
        child: listLoader ?? SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: FadingCircle(
                color: JPAppTheme.themeColors.primary,
                size: 25),
          ),
        ),
      );
    } else if (list.isEmpty) {
      return const Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: JPText(
            text: 'No record found',
            textSize: JPTextSize.heading4,
          ),
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 10),
        controller: scrollController,
        itemCount: getItemCount(),
        separatorBuilder: (_, index) => const SizedBox(height: 5,),
        itemBuilder: (_, index) => getItem(index)
      );
    }
  }

  Widget subTitle(int index) => Container(
        height: 36,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: JPColor.transparent,
        alignment: Alignment.centerLeft,
        child: JPText(
            text: list[index].label,
            textColor: JPAppTheme.themeColors.secondaryText,
            textSize: JPTextSize.heading5),
      );

  Widget items(int index) => InkWell(
        onTap: (list[index].onTapItem) ??
            (onSelect != null
                ? () {
                    onSelect!(list[index].id);
                  }
                : null),
        child: Container(
          height: 36,
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: list[index].id == selectedItemId
              ? JPAppTheme.themeColors.lightBlue
              : JPColor.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    list[index].child != null || list[index].color != null
                        ? Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: JPAvatar(
                              child: list[index].child ?? const SizedBox(),
                              borderColor: list[index].borderColor ??
                                  JPColor.transparent,
                              backgroundColor: list[index].color,
                              borderWidth: list[index].borderWidth,
                              size: JPAvatarSize.small,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Flexible(
                      child: JPText(
                          text: list[index].label,
                          overflow: TextOverflow.ellipsis)
                    ),
                    if((!(list[index].active ?? true) && showInActiveUserLabel))
                    JPText(
                    text: ' (Inactive)', 
                    textColor: JPAppTheme.themeColors.red, 
                    overflow: TextOverflow.ellipsis,
                  ), 

                  ],
                ),
              ),
              if (list[index].suffix != null)
                list[index].suffix ?? const SizedBox(),
              if (list[index].id == selectedItemId)
                JPIcon(Icons.done, color: JPAppTheme.themeColors.primary)
            ],
          ),
        ),
      );

  int getItemCount() {
    if(type == JPSingleSelectType.network) {
      return list.length + 1;
    }
    return list.length;
  }

  Widget getItem(int index) {

    if(index < list.length) {
      return AutoScrollTag(
        index: index,
        key: Key(index.toString()),
        controller: scrollController!,
        child: Material(
          color: JPColor.transparent,
          child: list[index].id == "sub_title"
              ? subTitle(index)
              : items(index),
        ),
      );
    } else if(index >= list.length && canShowLoadMore && type == JPSingleSelectType.network) {
      return Center(
        child: FadingCircle(
            color: JPAppTheme.themeColors.primary,
            size: 25),
      );
    } else {
      return const SizedBox();
    }
  }

}
