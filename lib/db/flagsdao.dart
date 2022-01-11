import 'package:flag_quiz/db/dbhelper.dart';
import 'package:flag_quiz/models/flags.dart';

class Flagsdao {
  Future<List<Flag>> getFlags() async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 4");

    return List.generate(maps.length, (i) {
      var line = maps[i];

      return Flag(line["bayrak_id"], line["bayrak_ad"], line["bayrak_resim"]);
    });
  }

  Future<List<Flag>> getFalseFlags(int bayrak_id) async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM bayraklar WHERE bayrak_id!=$bayrak_id ORDER BY RANDOM() LIMIT 3");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Flag(line["bayrak_id"], line["bayrak_ad"], line["bayrak_resim"]);
    });
  }
}
