import 'package:new_project/domain/infoLocaisRestaurantes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:new_project/db/db_helper.dart';

class LocaisRestaurantedao{

   Future<List<InfoLocaisRestaurantes>> findAll() async{
      DBHelper dbHelper = DBHelper();
      Database db = await dbHelper.initDB();

      String sql='SELECT * FROM PACOTE3;';
      final resultSet = await db.rawQuery(sql);

      List<InfoLocaisRestaurantes> listRestaurantes = [];

      for(var json in resultSet) {
         InfoLocaisRestaurantes pacote = InfoLocaisRestaurantes.fromJson(json);
         listRestaurantes.add(pacote);
      }
      return listRestaurantes;
   }
}