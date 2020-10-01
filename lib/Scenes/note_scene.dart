import 'package:everpobre/domain/note.dart';
import 'package:everpobre/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ChangeValueCallback = void Function(String value);

class NoteDetails extends StatefulWidget {
  static final routeName = RouteNames.routeNoteDetails;
  FocusNode textFocusNode = FocusNode();
  // State
  @override
  State<StatefulWidget> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Note _nota = ModalRoute.of(context).settings.arguments as Note;

    return keyboardDismisser(
        context: context,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Note Details"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(spacing: 10, runSpacing: 10, children: [
              const Text(
                "Descripción: ",
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
              ),
              CustomTextField(
                controller: _controller,
                text: _nota.body,
                onChangeValue: (value) {
                  _nota.editData(value);
                  Navigator.pop(context);
                },
              ),
            ]),
          ),
        ));
  }

  Widget keyboardDismisser({BuildContext context, Widget child}) {
    final gesture = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: child,
    );
    return gesture;
  }
}

class CustomTextField extends StatelessWidget {
  final String _text;
  final ChangeValueCallback _onChangeValue;
  final TextEditingController _controller;

  const CustomTextField(
      {TextEditingController controller,
      String text,
      ChangeValueCallback onChangeValue})
      : _text = text,
        _controller = controller,
        _onChangeValue = onChangeValue;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: Color(0xFFba68c8),
        ),
        primaryColor: const Color(0xFFba68c8),
        accentColor: const Color(0xFFba68c8),
        hintColor: Colors.grey,
        cursorColor: const Color(0xFFba68c8),
        focusColor: const Color(0xFFba68c8),
      ),
      child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: _text,
            hintText: "Modifica la nota",
          ),
          onSubmitted: (String value) async {
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Nota actualizada'),
                  content:
                      const Text('La nota se ha actualizado correctamente'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        _onChangeValue(value);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
