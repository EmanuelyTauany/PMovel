import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/domain/infoLocaisPousada.dart';

class FavoritosCubit extends Cubit<List<InfoLocaisPousada>> {
  List<InfoLocaisPousada> _pacotes;

  FavoritosCubit()
      : _pacotes = [],
        super([]);

  addFavorite(InfoLocaisPousada pacote) {
    print('Adicionado: ${pacote.nome}');
    _pacotes.add(pacote);
    emit(_pacotes);
  }

  isFavorite(InfoLocaisPousada pacote) {
    return _pacotes.contains(pacote);
  }
}
