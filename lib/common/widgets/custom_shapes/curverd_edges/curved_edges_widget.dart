import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/curverd_edges/curverd_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipPath(clipper: TCustomCurveEdges(), child: child),
    );
  }
}
