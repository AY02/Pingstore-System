import 'package:flutter/material.dart';
import 'package:pingstore_app/homepage/grid_buttons/convertButton/convert_failed.dart';
import 'package:pingstore_app/homepage/grid_buttons/convertButton/convert_successful.dart';
import 'package:pingstore_app/homepage/scan_button/insert%20record/socket_send.dart';
import 'package:pingstore_app/other/log.dart';

Future<void> convertFile(BuildContext context) async {
  log('Bottone di convert premuto', type: 'Convert Check');
  bool isSend = await sendTo('!convert', '192.168.1.42', 3001);
  if (isSend)
    insertSuccess(context);
  else
    insertFailed(context);
}