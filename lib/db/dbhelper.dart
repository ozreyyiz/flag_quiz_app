import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final String databaseName = "bayrakquiz.sqlite";

  static Future<Database> dbAccess() async {
    String dbPath = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(databaseName)) {
      print("Database accessed.");
    } else {
      ByteData data = await rootBundle.load("db/$databaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Database copied.");
    }
    return openDatabase(dbPath);
  }
}
