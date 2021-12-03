import 'package:flutter/material.dart';
import 'package:projeto_pb/screens/cadastro.dart';

void main() {
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
