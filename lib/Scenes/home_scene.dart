import 'package:everpobre/routes.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

class EverpobreHome extends StatelessWidget {
  static final routeName = RouteNames.mainRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.routeNotebooks);
          },
          child: const Text("Show Notebooks"),
        ),
      ),
    );
  }
}
