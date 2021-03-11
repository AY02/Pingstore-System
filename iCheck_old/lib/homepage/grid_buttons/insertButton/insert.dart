import 'package:flutter/material.dart';
import 'package:pingstore_app/file_manager/filemanager.dart';
import 'package:pingstore_app/homepage/scan_button/insert%20record/failedAlert.dart';
import 'package:pingstore_app/homepage/scan_button/insert%20record/socket_send.dart';
import 'package:pingstore_app/homepage/scan_button/insert%20record/successfulAlert.dart';
import 'package:pingstore_app/other/log.dart';

Future<Widget> insertForm(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      final List<TextEditingController> _record = new List(12);
      for(int i=0; i<_record.length; i++)
        _record[i] = TextEditingController();
      return AlertDialog(
        title: Text('Registra il prodotto', textAlign: TextAlign.center),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Barcode'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[0],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Descrizione'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[1],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Quantità'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[2],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Reparto'),
                  controller: _record[3],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Scorta'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[4],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Fornitore'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[5],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Costo'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[6],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Prezzo 1'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _record[7],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Prezzo 2'),
                  controller: _record[8],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Prezzo 3'),
                  controller: _record[9],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Note'),
                  controller: _record[10],
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Immagini'),
                  controller: _record[11],
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Inserisci'),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      String line = '${_record[0].text};${_record[1].text};${_record[2].text};${_record[3].text};${_record[4].text};${_record[5].text};${_record[6].text};${_record[7].text};${_record[8].text};${_record[9].text};${_record[10].text};${_record[11].text}';
                      bool isSended = await sendTo(line, '192.168.1.42', 3000);
                      if(isSended) {
                        log('Cose inserite:',type: 'Form Check');
                        log('Barcode: ${_record[0].text}',type: 'Form Check');
                        log('Descrizione: ${_record[1].text}',type: 'Form Check');
                        log('Quantità: ${_record[2].text}',type: 'Form Check');
                        log('Reparto: ${_record[3].text}',type: 'Form Check');
                        log('Scorta: ${_record[4].text}',type: 'Form Check');
                        log('Fornitore: ${_record[5].text}',type: 'Form Check');
                        log('Costo: ${_record[6].text}',type: 'Form Check');
                        log('Prezzo 1: ${_record[7].text}',type: 'Form Check');
                        log('Prezzo 2: ${_record[8].text}',type: 'Form Check');
                        log('Prezzo 3: ${_record[9].text}',type: 'Form Check');
                        log('Note: ${_record[10].text}',type: 'Form Check');
                        log('Immagini: ${_record[11].text}',type: 'Form Check');
                        log('Inserisco il record dentro il file...', type: 'File check');
                        FileManager f = new FileManager();
                        await f.init();
                        f.appendLine(line);
                        Navigator.of(context).pop();
                        log('Inserimento riuscito!', type: 'File check');
                        insertSuccess(context);
                      } else {
                        log('Inserimento fallito!', type: 'File check');
                        insertFailed(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}