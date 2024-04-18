import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/favoritos_cubit.dart';
import 'package:new_project/domain/infoLocaisPousada.dart';
import 'package:new_project/widgets/CardLocaisPousada.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          const SizedBox(height: 16),
          BlocBuilder<FavoritosCubit, List<InfoLocaisPousada>>(
              builder: (context, state) {
            var lista = state;
            if (lista.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return CardLocaisPousada(info: lista[index]);
                  });
            }

            return const Center(
              child: Text('Você não possui favoritos!',
                  style: TextStyle(fontSize: 24)),
            );
          })
        ]));
  }
}
