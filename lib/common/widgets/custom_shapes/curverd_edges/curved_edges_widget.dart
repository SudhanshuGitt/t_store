import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/curverd_edges/curverd_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurveEdges(), child: child);
  }
}
