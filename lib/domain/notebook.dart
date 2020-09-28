import 'package:everpobre/domain/note.dart';
import 'package:flutter/material.dart';

class Notebook with ChangeNotifier {
  static final shared = Notebook.generate();

  String _title = "";
  String _description = "";
  final List<Note> _notes = [];

  int get length => _notes.length;
  String get title => _title;
  String get description => _description;

  // Constructores
  Notebook(String title, String description) {
    _title = title;
    _description = description;
    _notes.addAll(List.generate(12, (index) => Note("Item $index")));
  }

  Notebook.generate() {
    _title = "Título del Notebook ";
    _description = "Este es un breve resumen del Notebook";
    _notes.addAll(List.generate(12, (index) => Note("Item $index")));
  }

  // Accesores
  Note operator [](int index) {
    return _notes[index];
  }

  // Mutadores
  bool remove(Note note) {
    final n = _notes.remove(note);
    notifyListeners();
    return n;
  }

  Note removeAt(int index) {
    final Note n = _notes.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Note note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notes>";
  }
}
