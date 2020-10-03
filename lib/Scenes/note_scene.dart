import 'package:everpobre/domain/note.dart';
import 'package:everpobre/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ChangeValueCallback = void Function(String value);

class NoteDetails extends StatefulWidget {
  static const routeName = RouteNames.routeNoteDetails;
  FocusNode textFocusNode = FocusNode();
  // State
  @override
  State<StatefulWidget> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  final TextEditingController _controller = TextEditingController();

  String _value = "";
  bool _validate = true;

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
            title: const Text(
              "Detalle",
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(spacing: 10, runSpacing: 10, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Descripción:",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                _nota.body,
                style: const TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              CustomTextField(
                controller: _controller,
                text: _nota.body,
                validate: _validate,
                onChangeValue: (value) {
                  _validate = true;
                  setState(() {});
                  _value = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: RaisedButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        _validate = false;
                        setState(() {});
                      } else {
                        _validate = true;
                        _nota.editData(_value);
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Actualizar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
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
  final bool _validate;

  const CustomTextField(
      {TextEditingController controller,
      String text,
      bool validate,
      ChangeValueCallback onChangeValue})
      : _text = text,
        _validate = validate,
        _controller = controller,
        _onChangeValue = onChangeValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: _text,
        hintText: "Modificar descripción de la nota",
        errorText: _validate ? null : "Este valor no puede estar vacío",
      ),
      onChanged: _onChangeValue,
    );
  }
}
