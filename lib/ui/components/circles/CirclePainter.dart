import 'package:flutter/cupertino.dart';

import 'CirclePainterCanvas.dart';

class CirclePainter extends StatelessWidget {
  const CirclePainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200), // Size of the canvas
      painter: CirclePainterCanvas(),
    );
  }

}
