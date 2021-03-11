import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/convertButton/convertImport.dart';

Widget convertButton(context) {
  return Card(
    color: Colors.lightBlue,
    child: InkWell(
      splashColor: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraint) {
        return new Icon(
          Icons.file_copy,
          size: constraint.biggest.height,
          color: Colors.black54,
        );
      }),
      onTap: () => convertFile(context),
    ),
  );
}