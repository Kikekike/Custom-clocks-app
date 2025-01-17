import 'dart:async';

import 'package:custom_clocks_app/ui/components/clocks/ClockPainter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumbersClockPage extends ConsumerStatefulWidget {
  const NumbersClockPage({super.key});

  @override
  ConsumerState<NumbersClockPage> createState() => _NumbersClockPageState();
}

class _NumbersClockPageState extends ConsumerState<NumbersClockPage> {
  late double _circleSize = 100.0;
  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();  // Update the current time every second
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _circleSize = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(64),
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(
            "${_currentTime.hour.toString().padLeft(2, '0')}:${_currentTime.minute.toString().padLeft(2, '0')}:${_currentTime.second.toString().padLeft(2, '0')}",
            style: const TextStyle(fontSize: 32),
          ),
          CustomPaint(
            size: Size(_circleSize, _circleSize),
            painter: ClockPainter(),
          )
        ],
      ),
    );
  }
}
