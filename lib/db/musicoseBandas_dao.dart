import 'package:new_project/domain/infoMB.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper2.dart';

class MusicoseBandasdao {
  Future<List<InfoMB>> findAll() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();
    //await Future.delayed(const Duration(seconds: 5));

    String sql = 'SELECT * FROM PACOTE;';
    final resultSet = await db.rawQuery(sql);

    List<InfoMB> listMusicos = [];

    for (var json in resultSet) {
      InfoMB pacote = InfoMB.fromJson(json);
      listMusicos.add(pacote);
    }
    return listMusicos;
  }
}
