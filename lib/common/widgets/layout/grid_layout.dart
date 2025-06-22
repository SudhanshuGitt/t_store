import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 288,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      // so that it does not take all the space available and shrink to attributes required
      shrinkWrap: true,
      // remove extra spacing from top
      padding: EdgeInsets.all(0),
      // grid will not scroll its children now
      physics: const NeverScrollableScrollPhysics(),
      // gridDelegate allow us to give spacing b/w the widgets main axis spacing
      // cross axis
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // mainAxis: vertical crossAxis: horizontal
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        // how much large one child of grid can be vertically height
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
