import 'package:flutter/material.dart';

Future<Widget> showRecord(String record, BuildContext context) {
  List<String> _attributes = record.split(';');
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Prodotto Registrato', textAlign: TextAlign.center),
        content: Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(children: [
              TableCell(child: Center(child: Text('Barcode'))),
              TableCell(child: Center(child: Text(_attributes[0]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Descrizione'))),
              TableCell(child: Center(child: Text(_attributes[1]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Quantità'))),
              TableCell(child: Center(child: Text(_attributes[2]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Reparto'))),
              TableCell(child: Center(child: Text(_attributes[3]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Scorta'))),
              TableCell(child: Center(child: Text(_attributes[4]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Fornitore'))),
              TableCell(child: Center(child: Text(_attributes[5]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Costo'))),
              TableCell(child: Center(child: Text(_attributes[6]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Prezzo 1'))),
              TableCell(child: Center(child: Text(_attributes[7]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Prezzo 2'))),
              TableCell(child: Center(child: Text(_attributes[8]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Prezzo 3'))),
              TableCell(child: Center(child: Text(_attributes[9]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Note'))),
              TableCell(child: Center(child: Text(_attributes[10]))),
            ]),
            TableRow(children: [
              TableCell(child: Center(child: Text('Immagini'))),
              TableCell(child: Center(child: Text(_attributes[11]))),
            ]),
          ],
        ),
      );
    },
  );
}