import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/curverd_edges/curverd_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurveEdges(), child: child);
  }
}
