import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/scan_button/insert%20record/insertRecordForm.dart';
import 'package:pingstore_app/homepage/showRecordForm.dart';
import 'package:pingstore_app/scanner/checkAll.dart';
import 'package:pingstore_app/scanner/scan.dart';

Widget scanButton(BuildContext context) {
  return FloatingActionButton(
    child: Icon(Icons.settings_overscan),
    onPressed: () => scan().then((barcode) async {
      List<dynamic> checkResult = await check(barcode);
      bool recordExists = checkResult[0];
      if(recordExists) {
        String record = checkResult[1];
        showRecord(record, context);
      } else {
        bool barcodeExists = checkResult[1];
        if(barcodeExists)
          insertRecord(barcode, context);
      }
    }),
  );
}