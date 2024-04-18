import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/favoritos_cubit.dart';
import 'package:new_project/domain/infoLocaisPousada.dart';
import 'package:new_project/pages/tela_detalhes.dart';

class CardLocaisPousada extends StatefulWidget {
  final InfoLocaisPousada info;
  const CardLocaisPousada({Key? key, required this.info}) : super(key: key);

  @override
  _CardLocaisPousadaState createState() => _CardLocaisPousadaState();
}

class _CardLocaisPousadaState extends State<CardLocaisPousada> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    isFavorite = context.read<FavoritosCubit>().isFavorite(widget.info);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return TelaDetalhes(infoLocaisPousada: widget.info);
          }),
        );
      },
      child: Card(
          color: Colors.white,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(widget.info.imagem,
                    height: 180, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 32,
                        color:
                            isFavorite ? const Color(0xFFE81F7C) : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = true;
                        });
                        context.read<FavoritosCubit>().addFavorite(widget.info);
                      })),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.info.nome,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    const SizedBox(height: 8),
                    Text(widget.info.desc,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
