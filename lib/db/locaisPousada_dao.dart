import 'package:new_project/domain/infoLocaisPousada.dart';
import  'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class LocaisPousadadao {

  Future<List<InfoLocaisPousada>> findAll() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql= 'SELECT * FROM PACOTE;';
    final resultSet = await db.rawQuery(sql);

   List<InfoLocaisPousada> listLocais =[];

   for(var json in resultSet) {
     InfoLocaisPousada pacote = InfoLocaisPousada.fromJson(json);
     listLocais.add(pacote);
   }

    return listLocais;
  }
}
