import 'package:everpobre/domain/notebooks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotebooksListView extends StatefulWidget {
  // Data
  final Notebooks _model;

  // Constructor
  const NotebooksListView(Notebooks model) : _model = model;

  @override
  State<StatefulWidget> createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
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
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NotebookSliver(widget._model, index);
      },
    );
  }
}

class NotebookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookSliver(Notebooks notebooks, int index)
      : this.notebooks = notebooks,
        this.index = index;

  _NotebookSliverState createState() => _NotebookSliverState();
}

class _NotebookSliverState extends State<NotebookSliver> {
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);

        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Notebook has been deleted!"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.book),
          title: Text(widget.notebooks[widget.index].title),
          subtitle: Text(widget.notebooks[widget.index].description),
          isThreeLine: true,
        ),
      ),
    );
  }
}
