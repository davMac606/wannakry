import 'package:wannakry/formulario.dart';
import 'package:wannakry/formularioexer.dart';
import 'package:wannakry/home_page.dart';
import 'package:flutter/material.dart';
import 'package:wannakry/tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: 
      {
        '/MyForm': (context) => const MyForm(),
        '/FormExercise': (context) => const FormExercise(),
        'TelaCadastrada': (context) => const TelaCadastrada(),
      },
      home: const HomePage(),
    );
  }
}