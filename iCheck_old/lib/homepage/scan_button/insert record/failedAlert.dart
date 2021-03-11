import 'package:flutter/material.dart';

Future<Widget> insertFailed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Inserimento del record fallito!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),
        ),
      );
    },
  );
}