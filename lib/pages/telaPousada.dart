import 'package:flutter/material.dart';
import 'package:new_project/db/locaisPousada_dao.dart';
import 'package:new_project/domain/infoLocaisPousada.dart';
import 'package:new_project/widgets/CardLocaisPousada.dart';

class TelaPousada extends StatefulWidget {
  const TelaPousada({Key? key}) : super(key: key);
  _TelaPousadaState createState() => _TelaPousadaState();
}

class _TelaPousadaState extends State<TelaPousada> {
  Future<List<InfoLocaisPousada>> futureLista = LocaisPousadadao().findAll();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List<InfoLocaisPousada>>(
            future: futureLista,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var lista = snapshot.data!;
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lista.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return Container(
                          child: CardLocaisPousada(info: lista[index]));
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
        //bottomNavigationBar: const BNCategorias(selectedIndex: 1),
      ),
    );
  }
}

buildAppBar() {
  return AppBar(
      backgroundColor: Color(0xff004b89),
      toolbarHeight: 70,
      title: const Text('Pousadas',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
      ]);
}
