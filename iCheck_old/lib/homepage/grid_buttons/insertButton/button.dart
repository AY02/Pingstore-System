import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/insertButton/insert.dart';

Widget insertButton(context) {
  return Card(
    color: Colors.lightBlue,
    child: InkWell(
      splashColor: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraint) {
        return new Icon(
          Icons.add_box_rounded,
          size: constraint.biggest.height,
          color: Colors.black54,
        );
      }),
      onTap: () => insertForm(context),
    ),
  );
}