
import 'package:flutter/material.dart';
import 'package:new_project/domain/InfoPerfil.dart';

class CardPerfil extends StatefulWidget {
  final InfoPerfil info;
  const CardPerfil({Key? key, required this.info});
  _CardPerfilState createState() => _CardPerfilState();
}

class _CardPerfilState extends State<CardPerfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [Color(0xff5467d4), Colors.blueAccent]),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/6073/6073873.png',
                          height: 200)),
                  Text(widget.info.nome_user,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff))),
                  Text('idade: ${widget.info.idade} anos',
                      style: const TextStyle(fontSize: 25)),
                  const Icon(Icons.online_prediction),
                  Text(widget.info.atividade,
                      style: const TextStyle(fontSize: 25)),
                  Text(widget.info.tipo, style: const TextStyle(fontSize: 25)),
                  const Text(' ', style: TextStyle(height: 50))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
