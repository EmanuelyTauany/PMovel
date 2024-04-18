import 'package:flutter/material.dart';
import 'package:new_project/db/locaisBeleza_dao.dart';
import 'package:new_project/domain/infoLocaisBeleza.dart';


class TelaBeleza extends StatefulWidget {
  const TelaBeleza({Key? key}) : super(key: key);

  @override
  State<TelaBeleza> createState() => _TelaBelezaState();
}

class _TelaBelezaState extends State<TelaBeleza> {
  Future<List<InfoLocaisBeleza>> infoBeleza = LocaisBelezadao().findAll();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            body: Padding(
                padding: const EdgeInsets.all(40),
                child: ListView(children: [
                  //FutureBuilder<List<InfoLocaisBeleza>>(
                  //future: infoBeleza,

                  // })
                ]))));
  }
}

buildAppBar() {
  return AppBar(
    backgroundColor: Color(0xff004b89),
    toolbarHeight: 70,
    title: Text('Beleza',
        style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 30,
            fontWeight: FontWeight.bold)),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
    ],
  );

  body:
  Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          SizedBox(height: 16),
        ],
      ));
}

buildCardLocais({
  required String imagem,
  required String titulo,
  required String email,
  required String desc,
}) {
  return Card(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(imagem, height: 200),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                email,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ],
    ),
  );
}
