import 'package:flutter/material.dart';
import 'package:new_project/pages/favoritos_page.dart';
import 'package:new_project/pages/telaBandaMusica.dart';
import 'package:new_project/pages/telaBeleza.dart';
import 'package:new_project/pages/telaPerfil.dart';
import 'package:new_project/pages/telaPousada.dart';

class TelaInicio extends StatefulWidget {
  const TelaInicio({Key? key}) : super(key: key);
  @override
  _TelaInicioState createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  @override
  int selectedIndex = 0;
  var telas = [
    _TelaInicioContent(localizacao: 'Arapiraca-AL'),
    Center(child: Text('Feed', style: TextStyle(fontSize: 24))),
    //Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
    TelaPerfil(),
    FavoritosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    String localizacao = 'Arapiraca, AL';
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
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
                icon: Icon(Icons.home_filled), label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(Icons.checklist_outlined), label: 'Feed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Perfil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos')
          ]),
      body: telas[selectedIndex],
    ));
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff004b89),
      toolbarHeight: 70,
      title: const Text('Find me',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const TelaPerfil();
            }));
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}

class _TelaInicioContent extends StatelessWidget {
  final String localizacao;

  _TelaInicioContent({required this.localizacao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  CardCategoria(
                      context: context,
                      categoria: 'Beleza',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/2553/2553646.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Pousadas',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/5900/5900195.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Alimentos',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/1365/1365577.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Músicos',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/2285/2285980.png'),
                  CardCategoria(
                    context: context,
                    categoria: 'Arte',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/1987/1987925.png',
                  ),
                  CardCategoria(
                      context: context,
                      categoria: 'Vestimenta',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/1686/1686032.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Mercados',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/3361/3361342.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Saúde',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/1436/1436585.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Esportes',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/2271/2271062.png'),
                  CardCategoria(
                      context: context,
                      categoria: 'Tecnologia',
                      image:
                          'https://cdn-icons-png.flaticon.com/512/3806/3806240.png'),
                  Text("Sua Localização atual: $localizacao",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold)),
                  Text("Empresas perto de você:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold)),
                ]),
          ),
        ],
      ),
    );
  }
}

class CardCategoria extends StatelessWidget {
  @override
  final BuildContext context;
  final String categoria;
  final String image;

  CardCategoria(
      {required this.context, required this.categoria, required this.image});

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xff76a2e3)),
        height: 100,
        width: 100,
        child: InkWell(
            onTap: () {
              if (categoria == 'Beleza') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaBeleza()),
                );
              }

              if (categoria == 'Pousadas') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaPousada()));
              }

              if (categoria == 'Músicos') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaBandaMusica()),
                );
              }

              //if (categoria == 'Alimentos') {
              //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context){

              //})
              //);
              //}
            },
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Image.network(image, height: 70)),
                          Center(
                            child: Text(
                              '$categoria',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            )));
  }
}
