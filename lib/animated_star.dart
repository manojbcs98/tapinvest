import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatingStar extends StatefulWidget {
  @override
  _RotatingStarState createState() => _RotatingStarState();
}

class _RotatingStarState extends State<RotatingStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _controller.value * 2 * math.pi,
      child: Icon(Icons.ac_unit, color: Colors.grey),
    );
  }
}
