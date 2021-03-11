import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/gridButtons.dart';
import 'scan_button/scanButton.dart';

class Homepage extends StatefulWidget {
  final String _title = 'PingStore Magazzino';
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        centerTitle: true,
      ),
      body: buttonGrid(context),
      floatingActionButton: scanButton(context),
    );
  }
}