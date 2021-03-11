import 'package:flutter/material.dart';

Future<Widget> insertFailed(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Errore durante la conversione', textAlign: TextAlign.center),
      );
    },
  );
}