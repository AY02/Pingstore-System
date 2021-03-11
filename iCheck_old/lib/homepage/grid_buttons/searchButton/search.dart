import 'package:flutter/material.dart';
import 'package:pingstore_app/file_manager/filemanager.dart';
import 'package:pingstore_app/homepage/grid_buttons/searchButton/notFoundRecord.dart';
import 'package:pingstore_app/homepage/showRecordForm.dart';
import 'package:pingstore_app/other/log.dart';

Future<Widget> searchRecord(BuildContext context) async {
  log('Bottone di ricerca premuto', type: 'Search Check');
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      final TextEditingController _barcode = new TextEditingController();
      return AlertDialog(
        title: Text('Cerca il prodotto', textAlign: TextAlign.center),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Barcode'),
                  validator: (value) => value.isEmpty ? 'Non può essere vuoto' : null,
                  controller: _barcode,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text('Cerca'),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      log('Cerco il prodotto...', type: 'Search Check');
                      FileManager f = new FileManager();
                      await f.init();
                      if(!f.fileExists) {
                        log('File inesistente, procedo alla creazione...', type: 'Search Check');
                        f.createFile();
                        log('File creato', type: 'Search Check');
                      }
                      if(f.lineExists(_barcode.text)) {
                        String record = await f.lineFromText(_barcode.text);
                        log('Record individuato: $record', type: 'Search Check');
                        showRecord(record, context);
                      } else {
                        log('Record inesistente', type: 'Search Check');
                        notFound(context);
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