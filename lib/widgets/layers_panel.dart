import 'package:flutter/material.dart';

class LayersPanel extends StatelessWidget {
  const LayersPanel({super.key, required this.selectedLayer, required this.onSelect});

  final int selectedLayer;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => Container(
        width: 230,
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        color: const Color(0xff202126),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('LAYERS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.4, color: Color(0xff92939b))),
          const SizedBox(height: 14),
          _LayerTile(name: 'Sketch', icon: Icons.brush_rounded, selected: selectedLayer == 0, onTap: () => onSelect(0)),
          _LayerTile(name: 'Background', icon: Icons.crop_square_rounded, selected: selectedLayer == 1, onTap: () => onSelect(1)),
          const Spacer(),
          const Divider(color: Color(0xff393a40)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Text('Canvas  •  1920 × 1080', style: TextStyle(fontSize: 11, color: Color(0xff777881)))),
        ]),
      );
}

class _LayerTile extends StatelessWidget {
  const _LayerTile({required this.name, required this.icon, required this.selected, required this.onTap});

  final String name;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          selected: selected,
          selectedTileColor: const Color(0xff37383e),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onTap: onTap,
          leading: Icon(icon, size: 18, color: selected ? const Color(0xffef7758) : const Color(0xff999aa1)),
          title: Text(name, style: const TextStyle(fontSize: 13)),
          trailing: const Icon(Icons.visibility_outlined, size: 16, color: Color(0xff888991)),
        ),
      );
}
