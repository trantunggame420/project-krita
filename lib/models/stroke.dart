import 'package:flutter/material.dart';

enum BrushType { pen, brush }

class Stroke {
  const Stroke({
    required this.points,
    required this.color,
    required this.width,
    this.brushType = BrushType.pen,
  });

  final List<Offset> points;
  final Color color;
  final double width;
  final BrushType brushType;
}