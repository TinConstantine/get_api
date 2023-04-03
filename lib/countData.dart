// ignore: file_names
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CountData {
  // lay duong dan
  // duong dan => string
  static Future<String> get getFilePath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //lay file => file
  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/count.txt');
  }

  // doc file => hien thi string => string
  static Future<String> readCount() async {
    try {
      final file = await getFile;
      String fileContent = await file.readAsString();
      return fileContent;
    } catch (e) {
      return e.toString();
    }
  }

  // save data vao file => return ve file
  static Future<File> saveCount(String count) async {
    final file = await getFile;
    return file.writeAsString(count);
  }
}
