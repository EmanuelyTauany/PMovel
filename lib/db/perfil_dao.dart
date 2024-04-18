import 'package:new_project/domain/InfoPerfil.dart';

class PerfilDao {
  var listPerfil = const [
    InfoPerfil(
        nome_user: 'Ana Maria',
        idade: 45,
        atividade: 'ativo(a)',
        tipo: 'consumidora')
  ];

  Future<List<InfoPerfil>> findAll() async {
    await Future.delayed(const Duration(seconds: 10));
    return listPerfil;
  }
}
