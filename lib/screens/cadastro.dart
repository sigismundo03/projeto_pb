import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';
import 'package:projeto_pb/screens/Loading.dart';
import 'package:projeto_pb/screens/error.dart';
import 'package:projeto_pb/screens/home.dart';
import 'package:projeto_pb/services/auth.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final AuthenticationServices _auth = AuthenticationServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset("assets/logo.png"),
                  TextFormField(
                    controller: _nameController,
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
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _emailController,
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
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: _passwordController,
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
                      onPressed: () async {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        setState(() {});
                      },
                      child: const Text("CONCLUIR CADASTRO"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    if (_error) {
      return ErrorScreen();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return LoadingScreen();
    }

    return HomeScreen();
  }
}
