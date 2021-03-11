import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/searchButton/search.dart';

Widget searchButton(context) {
  return Card(
    color: Colors.lightBlue,
    child: InkWell(
      splashColor: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraint) {
        return new Icon(
          Icons.search_outlined,
          size: constraint.biggest.height,
          color: Colors.black54,
        );
      }),
      onTap: () => searchRecord(context),
    ),
  );
}