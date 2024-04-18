import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacotefinal12345.db');

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    //print(dbPath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE pacote (id INTEGER PRIMARY KEY, nome varchar(100), imagem varchar(100), cidade varchar(100), email varchar(100), desc varchar(100), endereco varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO pacote (id, nome, imagem, cidade, email, desc, endereco) VALUES (1,'Hotel Confiança', 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/113088105.jpg?k=6bc943ddce0ce337d6d24a32e40f205e6efc58ebea834a304cbf330a1a01c1ea&o=&hp=1', 'ARAPIRACA, AL','Confianca@hotmail.com','Estamos aqui para te melhor atender!', 'R. Quinze de Novembro, 417 - Centro, Arapiraca - AL');";
    await db.execute(sql);
    sql =
        "INSERT INTO pacote (id, nome, imagem, cidade, email, desc, endereco) VALUES (2,'Hotel Pousada Talismã','https://cf.bstatic.com/xdata/images/hotel/max1024x768/217040612.jpg?k=6b672db4f02aaf8c70dd43ce8a6540c9201117c782b73f45c4300bc57cde2416&o=&hp=1', 'ARAPIRACA, AL', 'PousadaTalisma@gmail.com','A melhor da cidade!', 'R. Prof. Domingos Correia, 660 - Centro, Arapiraca - AL');";
    await db.execute(sql);

    onUpgrade(db, 1, version);

    sql =
        'CREATE TABLE pacote3 (id INTEGER PRIMARY KEY, imagem varchar(100), titulo varchar(100), email varchar(100), desc varchar(100), endereco varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO pacote3(id, imagem, titulo, email, desc, endereco) VALUES (1, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tudogostoso.com.br%2Fnoticias%2F7-dicas-para-a-pizza-caseira-ficar-igual-a-de-pizzaria-a6274.htm&psig=AOvVaw0V6qUoStxnOuVn-cIQUnYQ&ust=1691588985185000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKCy77qazYADFQAAAAAdAAAAABAI', 'Matafome Pizzaria', 'matafome@gmail.com', 'Variedades em pizzas para satisfazer à você e a sua família, com uma incrivel diversidade de sabores para te surpreender.', 'R. Francisco Arcuri, 81 - Jardim Peri, São Paulo - SP, 02650-010');";
    await db.execute(sql);

    sql =
        "INSERT INTO pacote3(id, imagem, titulo, email, desc, endereco) VALUES (2, 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tudogostoso.com.br%2Fnoticias%2F7-dicas-para-a-pizza-caseira-ficar-igual-a-de-pizzaria-a6274.htm&psig=AOvVaw0V6qUoStxnOuVn-cIQUnYQ&ust=1691588985185000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKCy77qazYADFQAAAAAdAAAAABAI', 'Super Burger Lanches', 'superburger2023@gmail.com', 'Variedades em pizzas para satisfazer à você e a sua família, com uma incrivel diversidade de sabores para te surpreender.', 'Av. Rio Branco - Manoel Teles, Arapiraca - AL, 57300-190');";
    await db.execute(sql);
  }

  Future<FutureOr<void>> onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      String sql =
          'CREATE TABLE user (username varchar(100) PRIMARY KEY, password varchar(100))';
      await db.execute(sql);

      sql =
          "INSERT INTO user (username, password) VALUES ('mariafernada@gmail.com','4321')";
      await db.execute(sql);
    }
  }
}
