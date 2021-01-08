import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class Record {
  record(option, timestamp) {}
}

class NullRecord implements Record {
  record(option, timestamp) {
    print('doing nothing');
  }
}

class InternalRecord implements Record {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data');
  }

  Future<File> writeCounter(int option, int timestamp) async {
    final file = await _localFile;
    return file.writeAsString(
        md5.convert(utf8.encode('$option $timestamp')).toString());
  }

  record(option, timestamp) {
    writeCounter(option, timestamp).then((success) => {}).whenComplete(() {
      print('recorded');
    });
  }
}

Record recordMapping(String record) {
  switch (record) {
    case ('Armazenamento Interno'):
      return InternalRecord();
    default:
      return NullRecord();
  }
  // 'Display Braille'::
}
