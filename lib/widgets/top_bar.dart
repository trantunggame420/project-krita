import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.canUndo, required this.canRedo, required this.onUndo, required this.onRedo, required this.onExport});

  final bool canUndo;
  final bool canRedo;
  final VoidCallback onUndo;
  final VoidCallback onRedo;
  final VoidCallback onExport;

  @override
  Widget build(BuildContext context) => Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(color: Color(0xff222328), border: Border(bottom: BorderSide(color: Color(0xff35363c)))),
        child: Row(children: [
          const Icon(Icons.palette_rounded, color: Color(0xffef7758), size: 27),
          const SizedBox(width: 10),
          const Text('KRITA', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 1.8)),
          const SizedBox(width: 28),
          const Text('Untitled painting', style: TextStyle(color: Color(0xffaaaab2))),
          const Spacer(),
          IconButton(tooltip: 'Undo', onPressed: canUndo ? onUndo : null, icon: const Icon(Icons.undo_rounded)),
          IconButton(tooltip: 'Redo', onPressed: canRedo ? onRedo : null, icon: const Icon(Icons.redo_rounded)),
          const SizedBox(width: 12),
          FilledButton.icon(onPressed: onExport, icon: const Icon(Icons.file_download_outlined, size: 18), label: const Text('Export')),
        ]),
      );
}
