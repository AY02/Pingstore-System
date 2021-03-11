import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class FileManager {
  String _title;
  File _f;
  Future<void> init() async {
    this._title = 'import.txt';
    String path = await filePath;
    this._f = File(path);
  }
  bool get fileExists => _f.existsSync();
  bool lineExists(String str) => read.contains(new RegExp(str, caseSensitive: false));
  void createFile() => _f.writeAsStringSync('', mode: FileMode.write);
  void appendLine(String line) => _f.writeAsStringSync('$line\n', mode: FileMode.append, flush: true);
  void cleanFile() => _f.writeAsStringSync('', mode: FileMode.write, flush: true);
  void deleteFile() => this._f.deleteSync();
  String get read => this._f.readAsStringSync();
  String get filename => this._title;
  Future<String> get filePath async {
    Directory directory = await getExternalStorageDirectory();
    return '${directory.path}/$_title';
  }
  Future<String> lineFromText(String str) async {
    String record = 'Non esiste';
    await this._f.openRead()
      .map(utf8.decode)
      .transform(new LineSplitter())
      .forEach((line) {
        if(line.contains(str))
          record = line;
      });
    return record;
  }
}