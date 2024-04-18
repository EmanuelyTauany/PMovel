import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/favoritos_cubit.dart';
import 'package:new_project/pages/telaLogin.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => FavoritosCubit(),
    child:
        const MaterialApp(debugShowCheckedModeBanner: false, home: TelaLogin()),
  ));
}
