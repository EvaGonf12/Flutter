import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.generate();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFede7f6),
        accentColor: Color(0xFFb39ddb),
        primaryColorLight: Color(0xFFffffff),
        primaryColorDark: Color(0xFFbbb5c3),
        scaffoldBackgroundColor: Color(0xFFffffff),
      ),
      title: TextResources.appName,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: NotebooksListView(model),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFbbb5c3),
          onPressed: () {
            model.add(Notebook.generate());
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
