import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project/domain/infoMB.dart';
import 'package:new_project/pages/map_Page.dart';

class TelaDetalhes2 extends StatefulWidget {
  final InfoMB infoMB;
  const TelaDetalhes2({super.key, required this.infoMB});

  @override
  State<TelaDetalhes2> createState() => _TelaDetalhes2State();
}

class _TelaDetalhes2State extends State<TelaDetalhes2> {
  InfoMB get pacote => widget.infoMB;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          Image.network(pacote.imagem, height: 300),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    Text(pacote.titulo,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text(pacote.desc, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text('Email para contato: ${pacote.email}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text('Instagram: ${pacote.instagram}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text("Próximo show em: ${pacote.pshow}",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text('Ver cidade do próximo show',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)))
                  ]))
        ])));
  }

  Future<void> onPressed() async {
    List<Location> locations = await locationFromAddress(pacote.pshow);
    LatLng latLng = LatLng(locations[0].latitude, locations[0].longitude);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MapPage(latLng: latLng);
    }));
  }
}
