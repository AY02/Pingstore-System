import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:pingstore_app/other/log.dart';
import 'dart:async';

Future<String> scan() async {
  String barcode = '';
  try {
    ScanResult scanResult = await BarcodeScanner.scan();
    barcode = scanResult.rawContent;
  } on PlatformException catch (e) {
    (e.code == BarcodeScanner.cameraAccessDenied) ?
      log('L\'utente non ha accettato la richiesta di accesso alla fotocamera!', type: 'Error check')
      : log('Errore sconosciuto: $e', type: 'Error check');
  }
  return barcode;
}