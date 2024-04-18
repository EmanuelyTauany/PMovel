import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacotefinal1100.db');

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE pacote (id INTEGER PRIMARY KEY, titulo varchar(100), imagem varchar(100), email varchar(100), desc varchar(100), genero varchar(100), instagram varchar(100), pshow varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO pacote (id, titulo, imagem, email, desc, genero, instagram, pshow) VALUES (1,'Sarah Beatriz','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTD6bV_UzLX2j9j_LIYLZdRzB51WwkawEaBdw&usqp=CAU','sarahbeatris@gmail.com','Gospel/Música Cristã','Gospel/Música Cristã', '@sarahbiaa', 'Aracaju-SE');";
    await db.execute(sql);
    sql =
        "INSERT INTO pacote (id, titulo, imagem, email, desc, genero, instagram, pshow) VALUES (2,'Gabriela Rocha','https://uploads.metropoles.com/wp-content/uploads/2020/06/14085532/gabriela-rocha1.jpg','rochaagabi@hotmail.com','Gospel/Música Cristã','Gospel/Música Cristã','@gabrielarocha77','Montenegro-RS');";
    await db.execute(sql);
    sql =
        "INSERT INTO pacote (id, titulo, genero, email, imagem, desc, instagram, pshow) VALUES (3, 'Nadson O Ferinha','Forró','ferolinadson@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaEU-TmCwx7JavNBSpzwmSeD-ceWyR6SBG3Q&usqp=CAU','Forró contemporâneo','@ferinhaonadson', 'Oieras-PI');";
    await db.execute(sql);

    sql =
        "INSERT INTO pacote (id, titulo, genero, email, imagem, desc, instagram, pshow) VALUES (4,'Silvanno Salles','MRB','sallesapaixonado@gmail.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpQYedMlY2b9NGXuVos0S_BPGAT92y8pahmQ&usqp=CAU','Música Regional Brasileira','@silvannosalles', 'Palmópolis-MG');";
    await db.execute(sql);

    onUpgrade(db, 1, version);
  }

  Future<FutureOr<void>> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql =
          'CREATE TABLE user (username varchar PRIMARY KEY, password varchar(100))';
      await db.execute(sql);

      sql =
          "INSERT INTO user(username, password) VALUES ('lauraribeiro@gmail.com', '121212')";
      await db.execute(sql);
    }
  }
}
