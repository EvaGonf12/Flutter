import 'package:everpobre/domain/notebook.dart';
import 'package:flutter/material.dart';
import 'package:everpobre/routes.dart';

class Notebooks with ChangeNotifier {
  // Data
  static final routeName = RouteNames.routeNotebooks;

  String _title = "";
  final List<Notebook> _notebooks = [];

  int get length => _notebooks.length;
  String get title => _title;

  // Constructores
  Notebooks();

  Notebooks.generate() {
    _title = "Notebooks";
    _notebooks.addAll(List.generate(2, (index) => Notebook.generate()));
  }

  // Accesores
  Notebook operator [](int index) {
    return _notebooks[index];
  }

  // Mutadores
  bool remove(Notebook notebook) {
    final n = _notebooks.remove(notebook);
    notifyListeners();
    return n;
  }

  Notebook removeAt(int index) {
    final Notebook n = _notebooks.removeAt(index);
    notifyListeners();
    return n;
  }

  void add(Notebook notebook) {
    _notebooks.insert(0, notebook);
    notifyListeners();
  }

  // Object Protocol
  @override
  String toString() {
    return "<$runtimeType: $length notebooks>";
  }
}
