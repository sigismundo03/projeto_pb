import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _password;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0, bottom: 0),
        children: [
          Container(
            height: 780,
            padding: const EdgeInsets.only(left: 60, right: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Image.asset("assets/logo.png"),
                Form(
                  key: _formKey1,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor preencha nome";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: "Nome",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey2,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor preencha e-mail";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey3,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor preencha a senha";
                      }
                    },
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        filled: true,
                        hintText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FlutterPasswordStrength(
                    password: _password,
                    strengthCallback: (strength) {
                      debugPrint(strength.toString());
                    }),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      if (_formKey1.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      if (_formKey2.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      if (_formKey3.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text("CONCLUIR CADASTRO"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
