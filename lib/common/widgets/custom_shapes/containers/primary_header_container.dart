import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/custom_shapes/curverd_edges/curved_edges_widget.dart';
import 'package:t_store/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        // we dont want any padding
        padding: const EdgeInsets.all(0),
        // we can give height so that there is something to show on screen
        // to prevent error size.infinite
        child: SizedBox(
          height: 400,
          // for creating custom shapes we are going to use stack widget
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TRoundedContainer(
                  width: 400,
                  height: 400,
                  radius: 400,
                  backgroundColor: TColors.white.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TRoundedContainer(
                  width: 400,
                  height: 400,
                  radius: 400,
                  backgroundColor: TColors.white.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
