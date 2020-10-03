import 'package:everpobre/domain/note.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesListView extends StatefulWidget {
  // Data
  final Notebook _model;

  // Constructor
  const NotesListView(Notebook model) : _model = model;

  // State
  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notas de '${widget._model.title}'",
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: widget._model.length,
        itemBuilder: (context, index) {
          return NoteSliver(widget._model, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFffeb3b),
        onPressed: () {
          widget._model.add(Note("Nueva nota"));
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

class NoteSliver extends StatefulWidget {
  final Notebook notebook;
  final int index;

  const NoteSliver(Notebook notebook, int index)
      : this.notebook = notebook,
        this.index = index;

  @override
  _NoteSliverState createState() => _NoteSliverState();
}

class _NoteSliverState extends State<NoteSliver> {
  @override
  Widget build(BuildContext context) {
    final DateFormat fmt = DateFormat("yyyy-mm-dd");

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebook.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Note has been deleted!"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
        child: Card(
          child: InkWell(
            onTap: () => {
              Navigator.pushNamed(
                context,
                RouteNames.routeNoteDetails,
                arguments: widget.notebook[widget.index],
              ).then((value) => {setState(() {})}),
            },
            highlightColor: Colors.grey[300],
            child: ListTile(
              leading: const Icon(Icons.toc),
              title: Text(widget.notebook[widget.index].body),
              subtitle: Text(
                  fmt.format(widget.notebook[widget.index].modificationDate)),
            ),
          ),
        ),
      ),
    );
  }
}
