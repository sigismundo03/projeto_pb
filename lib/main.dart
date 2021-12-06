import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_pb/screens/Loading.dart';
import 'package:projeto_pb/screens/cadastro.dart';
import 'package:projeto_pb/screens/error.dart';
import 'package:projeto_pb/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cadastro(),
    );
  }
}
