import 'package:flutter/material.dart';
import 'package:new_project/pages/telaCadastro.dart';
import 'package:new_project/pages/telaInicio.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});
  _TelaLoginState createState() => _TelaLoginState();
}

String email = '';
String senha = '';

class _TelaLoginState extends State<TelaLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.deepPurple]),
          ),
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24),
              Center(
                  child: Text("Find me",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              SizedBox(height: 6),
              Text(
                "Empresas perto de você!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 30),
              TextField(
                onChanged: (text) {
                  email = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (text) {
                  senha = text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TelaInicio();
                    }),
                  );
                  /*if (email == 'eloisa@gmail.com' && senha == '123') {
                    print("Login correto");
                  }*/
                },
                style: ElevatedButton.styleFrom(primary: Color(0xff004aad)),
                child: Text('Entrar',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              //SizedBox(height: 30),
              //Text('Ainda não é cadastrado?',
              //  style: TextStyle(fontSize: 20, color: Colors.white)),
              //SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TelaCadastro();
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(primary: Color(0xff004aad)),
                child: Text('Cadastre-se',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
