import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// if you  want to add the background color to the tabs you have to wrap them in Material widget
  /// To do that we need [PreferredSize] widget and that's why created custom class
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Material(
      color: isDarkMode ? TColors.black : TColors.white,
      child: TabBar(
        // horizontal direction scroll
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: isDarkMode ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
