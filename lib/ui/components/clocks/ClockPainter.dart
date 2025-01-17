import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);
    final DateTime time = DateTime.now();

    final Paint circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint handPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0;

    // Draw clock circle
    canvas.drawCircle(center, radius, circlePaint);

    // Draw hour markers
    for (int hour = 1; hour <= 12; hour++) {
      final double angle = (hour - 3) * 30 * pi / 180;
      final double x = centerX + cos(angle) * radius * 0.8;
      final double y = centerY + sin(angle) * radius * 0.8;

      TextPainter(
        text: TextSpan(
          text: '$hour',
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout()
        ..paint(canvas, Offset(x - 6, y - 8));
    }

    // Correct hour hand calculation

    print("Time: ${time.hour % 12} ${time.minute} ${time.second}");

    final double hourRadians = (((time.hour % 12) + time.minute / 60) * 30 * pi / 180) - (pi / 2);
    drawHand(canvas, center, radius * 0.4, hourRadians, Colors.black);

    // Correct minute hand calculation
    final minuteRadians = ((time.minute + time.second / 60) * 6 * pi / 180) - (pi / 2);
    drawHand(canvas, center, radius * 0.6, minuteRadians, Colors.blue);

    // Draw second hand
    final secondRadians = (time.second * 6 * pi / 180) - (pi / 2);
    drawHand(canvas, center, radius * 0.7, secondRadians, Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;  // Repaint every second
  }

  void drawHand(Canvas canvas, Offset center, double length, double radians, Color color) {
    final double x = center.dx + cos(radians) * length;
    final double y = center.dy + sin(radians) * length;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 4.0;
    canvas.drawLine(center, Offset(x, y), paint);
  }

}