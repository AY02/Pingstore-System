import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/convertButton/button.dart';
import 'package:pingstore_app/homepage/grid_buttons/insertButton/button.dart';
import 'package:pingstore_app/homepage/grid_buttons/searchButton/button.dart';

Widget buttonGrid(context) {
  return GridView.count(
    padding: EdgeInsets.all(10),
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    crossAxisCount: 2,
    children: [
      searchButton(context),
      insertButton(context),
      convertButton(context),
    ],
  );
}