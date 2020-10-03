import 'package:everpobre/Scenes/home_scene.dart';
import 'package:everpobre/Scenes/note_scene.dart';
import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:everpobre/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Notebooks modelNotebooks = Notebooks.generate();
final Notebook modelNotes = Notebook.generate();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFffeb3b),
        accentColor: const Color(0xFFb39ddb),
        primaryColorLight: const Color(0xFFffff72),
        primaryColorDark: const Color(0xFFc8b900),
        scaffoldBackgroundColor: const Color(0xFFffffff),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff455a64),
        ),
        hintColor: Colors.grey,
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Color(0xFFffeb3b),
        ),
      ),
      title: TextResources.appName,
      routes: {
        RouteNames.mainRoute: (context) => EverpobreHome(),
        RouteNames.routeNotebooks: (context) =>
            NotebooksListView(modelNotebooks),
        RouteNames.routeNotes: (context) => NotesListView(modelNotes),
        RouteNames.routeNoteDetails: (context) => NoteDetails(),
      },
      initialRoute: RouteNames.mainRoute,
    );
  }
}
