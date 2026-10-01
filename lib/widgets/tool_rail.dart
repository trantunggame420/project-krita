import 'package:flutter/material.dart';
import '../models/stroke.dart';

class ToolRail extends StatelessWidget {
  const ToolRail({
    super.key,
    required this.isEraser,
    required this.brushType,
    required this.onPen,
    required this.onBrush,
    required this.onEraser,
    required this.onClear,
  });

  final bool isEraser;
  final BrushType brushType;
  final VoidCallback onPen;
  final VoidCallback onBrush;
  final VoidCallback onEraser;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) => Container(
        width: 72,
        color: const Color(0xff202126),
        child: Column(children: [
          const SizedBox(height: 18),
          _RailButton(icon: Icons.edit_rounded, label: 'Pen', selected: !isEraser && brushType == BrushType.pen, onTap: onPen),
          _RailButton(icon: Icons.brush_rounded, label: 'Brush', selected: !isEraser && brushType == BrushType.brush, onTap: onBrush),
          _RailButton(icon: Icons.auto_fix_high_rounded, label: 'Eraser', selected: isEraser, onTap: onEraser),
          const Spacer(),
          _RailButton(icon: Icons.delete_outline_rounded, label: 'Clear', onTap: onClear),
          const SizedBox(height: 18),
        ]),
      );
}

class _RailButton extends StatelessWidget {
  const _RailButton({required this.icon, required this.label, required this.onTap, this.selected = false});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: IconButton(
          tooltip: label,
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: selected ? const Color(0xffef7758) : Colors.transparent,
            foregroundColor: selected ? Colors.white : const Color(0xffaaaab2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          icon: Icon(icon),
        ),
      );
}
