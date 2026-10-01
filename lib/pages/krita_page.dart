import 'package:flutter/material.dart';
import '../providers/drawing_provider.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/canvas_widget.dart';
import '../widgets/layers_panel.dart';
import '../widgets/top_bar.dart';
import '../widgets/tool_rail.dart';

class KritaPage extends StatefulWidget {
  const KritaPage({super.key});

  @override
  State<KritaPage> createState() => _KritaPageState();
}

class _KritaPageState extends State<KritaPage> {
  final DrawingProvider _drawing = DrawingProvider();

  @override
  void dispose() {
    _drawing.dispose();
    super.dispose();
  }

  void _showExportMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Karya siap diekspor sebagai PNG.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _drawing,
      builder: (context, _) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TopBar(
                canUndo: _drawing.canUndo,
                canRedo: _drawing.canRedo,
                onUndo: _drawing.undo,
                onRedo: _drawing.redo,
                onExport: _showExportMessage,
              ),
              Expanded(
                child: Row(
                  children: [
                    ToolRail(
                      isEraser: _drawing.isEraser,
                      brushType: _drawing.brushType,
                      onPen: _drawing.selectPen,
                      onBrush: _drawing.selectBrush,
                      onEraser: _drawing.selectEraser,
                      onClear: _drawing.clearCanvas,
                    ),
                    Expanded(
                      child: CanvasWidget(
                        strokes: _drawing.strokes,
                        color: _drawing.isEraser
                            ? const Color(0xfffaf9f6)
                            : _drawing.color,
                        brushSize: _drawing.brushSize,
                        brushType: _drawing.brushType,
                        onStroke: _drawing.addStroke,
                      ),
                    ),
                    LayersPanel(
                      selectedLayer: _drawing.selectedLayer,
                      onSelect: _drawing.selectLayer,
                    ),
                  ],
                ),
              ),
              BottomBar(
                color: _drawing.color,
                brushSize: _drawing.brushSize,
                isEraser: _drawing.isEraser,
                onColor: _drawing.selectColor,
                onSize: _drawing.setBrushSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}