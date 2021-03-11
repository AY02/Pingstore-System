import 'dart:io';
import 'package:pingstore_app/other/log.dart';

Future<bool> sendTo(String line, String host, int port) async {
  log('Connetto al server $host:$port...', type: 'Socket check');
  try {
    Socket s = await Socket.connect(host, port);
    log('Connessione al server riuscita, invio il record $line...', type: 'Socket check');
    s.write(line);
    log('Record inviato, chiudo il socket...', type: 'Socket check');
    s.close();
    log('Chiusura riuscita', type: 'Socket check');
    return true;
  } catch(e) {
    log('Errore di connessione col socket: $e', type: 'Socket error');
    return false;
  }
}