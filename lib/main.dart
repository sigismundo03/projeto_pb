import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _password;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 40, left: 60, right: 60),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fundo.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    hintText: "Nome",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    hintText: "E-mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    hintText: "Senha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
              ),
              SizedBox(
                height: 30,
              ),
              FlutterPasswordStrength(
                  password: _password,
                  strengthCallback: (strength) {
                    debugPrint(strength.toString());
                  }),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {},
                  child: Text("CONCLUIR CADASTRO"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
