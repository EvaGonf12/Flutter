import 'package:everpobre/routes.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

class EverpobreHome extends StatelessWidget {
  static const routeName = RouteNames.mainRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextResources.appName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.routeNotebooks);
          },
          child: const Text("Ver Notebooks",
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
