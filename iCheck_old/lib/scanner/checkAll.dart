import 'package:pingstore_app/file_manager/filemanager.dart';
import 'package:pingstore_app/other/log.dart';

Future<List<dynamic>> check(String barcode) async {
  if(barcode.isNotEmpty) {
    log('Barcode code: $barcode', type: 'Scanner check');
    FileManager filemanager = new FileManager();
    await filemanager.init();
    log('Controllo se il file esiste...', type: 'File check');
    if(filemanager.fileExists) {
      log('File esistente', type: 'File check');
    } else {
      log('File inesistente, procedo alla creazione...', type: 'File check');
      filemanager.createFile();
      log('File creato', type: 'File check');
    }
    log('Controllo se il record esiste...', type: 'Record check');
    if(filemanager.lineExists(barcode)) {
      log('Record e\' esistente, procedo ad aprire il form showRecord()...', type: 'Record check');
      return [true, await filemanager.lineFromText(barcode)];
    } else {
      log('Record inesistente, procedo ad aprire il form insertRecord()...', type: 'Record check');
    }
  } else {
    log('Barcode vuoto', type: 'Barcode check');
    return[false, false];
  }
  return [false, true];
}