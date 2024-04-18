import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project/pages/telaInicio.dart';


class BNCategorias extends StatefulWidget {
  final int selectedIndex;
  const BNCategorias({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BNCategorias> createState() => _BNCategoriasState();
}

class _BNCategoriasState extends State<BNCategorias> {
  var selectedIndex = 0;
  var telas = const [
    TelaInicio(),
    Center(child: Text('Feed', style: TextStyle(fontSize: 24))),
    Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: telas[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: const Color(0xc3ff5d5d),
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
            ]),
      ),
    );
  }
}
