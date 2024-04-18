import 'package:flutter/material.dart';
import 'package:new_project/domain/infoMB.dart';
import 'package:new_project/pages/tela_detalhes2.dart';

class CardMusicos extends StatefulWidget {
  final InfoMB infoMB;
  const CardMusicos({Key? key, required this.infoMB}) : super(key: key);

  @override
  State<CardMusicos> createState() => _CardMusicosState();
}

class _CardMusicosState extends State<CardMusicos> {
  bool isFavorite = false;

  @override
  //void initState(){
  //super.initState();
  // isFavorite =
  //  context
  // .read<FavoritosCubit>()
  //.isFavorite(widget.infoMB);

  //}

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TelaDetalhes2(infoMB: widget.infoMB);
            },
          ));
        },
        child: Card(
            color: Colors.white,
            child: Stack(children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(widget.infoMB.imagem,
                    height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 32,
                                color: isFavorite
                                    ? const Color(0xFFE81F7C)
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isFavorite = true;
                                });
                                //context
                                //.read<FavoritosCubit>()
                                //.addFavorite(widget.infoMB);
                              })),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.infoMB.titulo,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.infoMB.desc,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )
                            ],
                          )),
                    ],
                  ))
            ])));
  }
}
