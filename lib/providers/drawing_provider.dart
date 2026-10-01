import 'package:flutter/material.dart';
import '../models/stroke.dart';

class DrawingProvider extends ChangeNotifier {
  final List<List<Stroke>> _history = [[]];
  int _historyIndex = 0;
  Color _color = const Color(0xff17181c);
  double _brushSize = 12;
  bool _isEraser = false;
  BrushType _brushType = BrushType.pen;
  int _selectedLayer = 0;

  List<Stroke> get strokes => _history[_historyIndex];
  Color get color => _color;
  double get brushSize => _brushSize;
  bool get isEraser => _isEraser;
  BrushType get brushType => _brushType;
  int get selectedLayer => _selectedLayer;
  bool get canUndo => _historyIndex > 0;
  bool get canRedo => _historyIndex < _history.length - 1;

  void addStroke(Stroke stroke) => _commit([...strokes, stroke]);
  void clearCanvas() => _commit([]);

  void undo() {
    if (canUndo) {
      _historyIndex--;
      notifyListeners();
    }
  }

  void redo() {
    if (canRedo) {
      _historyIndex++;
      notifyListeners();
    }
  }

  void selectColor(Color color) {
    _color = color;
    _isEraser = false;
    _brushType = BrushType.pen;
    notifyListeners();
  }

  void selectPen() {
    _isEraser = false;
    _brushType = BrushType.pen;
    notifyListeners();
  }

  void selectBrush() {
    _isEraser = false;
    _brushType = BrushType.brush;
    notifyListeners();
  }

  void selectEraser() {
    _isEraser = true;
    notifyListeners();
  }

  void setBrushSize(double size) {
    _brushSize = size;
    notifyListeners();
  }

  void selectLayer(int index) {
    _selectedLayer = index;
    notifyListeners();
  }

  void _commit(List<Stroke> nextStrokes) {
    _history.removeRange(_historyIndex + 1, _history.length);
    _history.add(nextStrokes);
    _historyIndex++;
    notifyListeners();
  }
}