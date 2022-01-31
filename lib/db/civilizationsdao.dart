import 'package:flag_quiz/db/dbhelper.dart';
import 'package:flag_quiz/models/flags.dart';

class Civilizationsdao {
  Future<List<Flag>> getFlags() async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM civilizations ORDER BY RANDOM()");

    return List.generate(maps.length, (i) {
      var line = maps[i];
      return Flag(line["flag_id"], line["flag_name"], line["flag_url"]);
    });
  }

  Future<List<Flag>> getFalseFlags(int flag_id) async {
    var db = await DbHelper.dbAccess();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM civilizations WHERE flag_id!=$flag_id ORDER BY RANDOM ()");

    return List.generate(maps.length, (i) {
      var line = maps[i];

      return Flag(line["flag_id"], line["flag_name"], line["flag_url"]);
    });
  }
}
