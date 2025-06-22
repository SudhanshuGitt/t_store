import 'package:flutter/material.dart';

class CustomCurveEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // path is going to define the shape
    var path = Path();

    // s horizontal y vertical
    // size is the size of children in which we use it custom widget
    path.lineTo(0, size.height);

    // start from the left corner so 0
    // to create the curve we need to go upwards from the bottom
    final firstCurve = Offset(0, size.height - 20);
    // In x axis direction we are moving to right side
    final lastCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    // draw th st line
    // 0 is pointing where we ended the path
    final secondFirstCurve = Offset(0, size.height - 20);
    // curve to stop 30 px before full width and height is size.height - 20
    final secondLastCurve = Offset(size.width - 30, size.height - 20);

    path.quadraticBezierTo(
      secondFirstCurve.dx,
      secondFirstCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    // draw last curve
    // size.width means its pointing at the end
    final thirdFirstCurve = Offset(size.width, size.height - 20);
    // it will end at full width and height
    final thirdLastCurve = Offset(size.width, size.height);

    path.quadraticBezierTo(
      thirdFirstCurve.dx,
      thirdFirstCurve.dy,
      thirdLastCurve.dx,
      thirdLastCurve.dy,
    );

    // when path is complete it can take the complete width
    // height is 0 so height is coming from bottom to top
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
