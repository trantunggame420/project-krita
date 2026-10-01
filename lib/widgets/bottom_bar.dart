import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key, required this.color, required this.brushSize, required this.isEraser, required this.onColor, required this.onSize});

  final Color color;
  final double brushSize;
  final bool isEraser;
  final ValueChanged<Color> onColor;
  final ValueChanged<double> onSize;

  static const colors = [
    Color(0xff17181c),
    Color(0xffef7758),
    Color(0xfff2bf5d),
    Color(0xff65b9a7),
    Color(0xff6c91d8),
    Color(0xfff3f1ec),
  ];

  @override
  Widget build(BuildContext context) => Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: const BoxDecoration(
          color: Color(0xff222328),
          border: Border(top: BorderSide(color: Color(0xff35363c))),
        ),
        child: Row(children: [
          Text(isEraser ? 'Eraser' : 'Brush', style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 18),
          ...colors.map((item) => GestureDetector(
                onTap: () => onColor(item),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: item,
                    shape: BoxShape.circle,
                    border: Border.all(color: color == item ? Colors.white : Colors.transparent, width: 2),
                  ),
                ),
              )),
          const Spacer(),
          const Text('Size', style: TextStyle(color: Color(0xffaaaab2), fontSize: 12)),
          SizedBox(width: 150, child: Slider(value: brushSize, min: 2, max: 50, onChanged: onSize, activeColor: const Color(0xffef7758))),
          SizedBox(width: 38, child: Text('${brushSize.round()} px', style: const TextStyle(fontSize: 12))),
        ]),
      );
}
