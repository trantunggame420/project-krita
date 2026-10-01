import 'package:flutter/material.dart';
import '../models/stroke.dart';

class CanvasWidget extends StatefulWidget {
  const CanvasWidget({
    super.key,
    required this.strokes,
    required this.color,
    required this.brushSize,
    required this.brushType,
    required this.onStroke,
  });

  final List<Stroke> strokes;
  final Color color;
  final double brushSize;
  final BrushType brushType;
  final ValueChanged<Stroke> onStroke;

  @override
  State<CanvasWidget> createState() => _CanvasWidgetState();
}

class _CanvasWidgetState extends State<CanvasWidget> {
  List<Offset> _points = [];

  @override
  Widget build(BuildContext context) => Container(
        color: const Color(0xff17181c),
        alignment: Alignment.center,
        child: LayoutBuilder(builder: (context, constraints) {
          final canvasSize = Size(constraints.maxWidth - 88, constraints.maxHeight - 72);
          return GestureDetector(
            onPanStart: (details) => setState(() => _points = [details.localPosition]),
            onPanUpdate: (details) => setState(() => _points = [..._points, details.localPosition]),
            onPanEnd: (_) {
              if (_points.length > 1) {
                widget.onStroke(
                  Stroke(
                    points: _points,
                    color: widget.color,
                    width: widget.brushSize,
                    brushType: widget.brushType,
                  ),
                );
              }
              setState(() => _points = []);
            },
            child: CustomPaint(
              size: canvasSize,
              painter: CanvasPainter(
                widget.strokes,
                _points.isEmpty
                    ? null
                    : Stroke(
                        points: _points,
                        color: widget.color,
                        width: widget.brushSize,
                        brushType: widget.brushType,
                      ),
              ),
            ),
          );
        }),
      );
}

class CanvasPainter extends CustomPainter {
  const CanvasPainter(this.strokes, this.activeStroke);

  final List<Stroke> strokes;
  final Stroke? activeStroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xfffaf9f6));
    for (final stroke in [...strokes, if (activeStroke != null) activeStroke!]) {
      final paint = Paint()
        ..color = stroke.color
        ..strokeWidth = stroke.width
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;
      if (stroke.brushType == BrushType.brush) {
        paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      }
      for (var index = 0; index < stroke.points.length - 1; index++) {
        canvas.drawLine(stroke.points[index], stroke.points[index + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CanvasPainter oldDelegate) => oldDelegate.strokes != strokes || oldDelegate.activeStroke != activeStroke;
}
