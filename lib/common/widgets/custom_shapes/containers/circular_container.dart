import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = TColors.white,
  });

  final double? height, width;
  final double radius, padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        // to get the complete circle we have to give same as width and height
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
