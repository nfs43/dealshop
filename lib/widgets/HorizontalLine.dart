import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final Color color;
  final double height;

  HorizontalLine({this.color = Colors.grey, this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}