import 'package:flutter/material.dart';
import 'package:new_project/db/musicoseBandas_dao.dart';
import 'package:new_project/domain/infoMB.dart';
import 'package:new_project/pages/telaInicio.dart';
import 'package:new_project/pages/telaPerfil.dart';
import 'package:new_project/widgets/CardMusicos.dart';

class TelaBandaMusica extends StatefulWidget {
  const TelaBandaMusica({super.key});
  _TelaBandaMusicaState createState() => _TelaBandaMusicaState();
}

class _TelaBandaMusicaState extends State<TelaBandaMusica> {
  int selectedIndex = 0;
  Future<List<InfoMB>> futureLista = MusicoseBandasdao().findAll();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List<InfoMB>>(
            future: futureLista,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var lista = snapshot.data!;
                return ListView.separated(
                    shrinkWrap: true,
                    //physics:
                    itemCount: lista.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return Container(
                          child: CardMusicos(infoMB: lista[index]));
                    });
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    ));
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff004b89),
      toolbarHeight: 70,
      title: const Text('Música ',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
      ],
    );
  }

  buildBNCategorias() {
    var telas = const [
      TelaInicio(),
      Center(child: Text('Feed', style: TextStyle(fontSize: 24))),
      //Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
      TelaPerfil()
    ];
    return BottomNavigationBar(
        selectedItemColor: const Color(0xc30027d2),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Perfil'),
        ]);
  }
}
