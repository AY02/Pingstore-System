import 'package:flutter/material.dart';

Future<Widget> notFound(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Record non trovato', textAlign: TextAlign.center),
      );
    },
  );
}