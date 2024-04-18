import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project/domain/infoLocaisPousada.dart';
import 'package:new_project/pages/map_Page.dart';

class TelaDetalhes extends StatefulWidget {
  final InfoLocaisPousada infoLocaisPousada;
  const TelaDetalhes({Key? key, required this.infoLocaisPousada})
      : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  InfoLocaisPousada get pacote => widget.infoLocaisPousada;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          Image.network(pacote.imagem),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(pacote.nome, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text(pacote.desc, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text(pacote.email, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text('Abrir localização no mapa',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)))
                  ]))
        ])));
  }

  Future<void> onPressed() async {
    List<Location> locations = await locationFromAddress(pacote.endereco);
    LatLng latLng = LatLng(locations[0].latitude, locations[0].longitude);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MapPage(latLng: latLng);
      }),
    );
  }
}
