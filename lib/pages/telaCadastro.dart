import 'package:flutter/material.dart';
import 'package:new_project/pages/telaInicio.dart';


class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [Colors.blue, Colors.deepPurple])),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Digite seu nome:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            TextField(),
            SizedBox(height: 16),
            Text('Digite seu email:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            TextField(),
            SizedBox(height: 16),
            Text('Digite um número de telefone para contato:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            TextField(),
            SizedBox(height: 16),
            Text('Gênero | Tipo de empresa:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            SizedBox(height: 16),
            TextField(),
            SizedBox(height: 16),
            Text('Digite sua idade:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            TextField(),
            SizedBox(height: 16),
            Text('Digite uma senha:',
                style: TextStyle(fontSize: 25, color: Color(0xffffffff))),
            TextField(),
            Text('Confirme sua senha:',
                style: TextStyle(fontSize: 25, color: Color(0xfffffefe))),
            TextField(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TelaInicio();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Color(0xff004aad)),
              child: Text('CADASTRAR!',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    ));
  }
}

buildAppBar() {
  return AppBar(
      backgroundColor: Color(0xff004b89),
      toolbarHeight: 70,
      title: const Text('Cadastro',
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 30,
              fontWeight: FontWeight.bold)),
      centerTitle: true);
}
