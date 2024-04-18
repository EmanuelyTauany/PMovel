import 'package:flutter/material.dart';
import 'package:new_project/db/perfil_dao.dart';
import 'package:new_project/domain/InfoPerfil.dart';
import 'package:new_project/pages/telaInicio.dart';
import 'package:new_project/widgets/CardPerfil.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  Future<List<InfoPerfil>> futureLista = PerfilDao().findAll();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: buildAppBar(),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(children: [
                  FutureBuilder<List<InfoPerfil>>(
                      future: futureLista,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var lista = snapshot.data!;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: lista.length,
                              itemBuilder: (context, index) {
                                return CardPerfil(info: lista[index]);
                              });
                        }
                        return const Center(child: CircularProgressIndicator());
                      })
                ]))));
  }

  buildAppBar() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        title: const Text(
          'Perfil',
          style: TextStyle(
              color: Color(0x82501500),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true);
  }

  buildBNCategoria() {
    int selectedIndex = 2;
    var telas = const [
      TelaInicio(),
      Center(child: Text('Feed', style: TextStyle(fontSize: 24))),
      TelaPerfil()
    ];
    return BottomNavigationBar(
        selectedItemColor: const Color(0xc30027d2),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Início'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Perfil')
        ]);
  }
}
