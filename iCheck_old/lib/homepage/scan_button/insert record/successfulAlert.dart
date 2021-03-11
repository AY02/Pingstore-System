import 'package:flutter/material.dart';

Future<Widget> insertSuccess(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Record inserito con successo!', textAlign: TextAlign.center),
      );
    },
  );
}