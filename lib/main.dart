import 'package:wannakry/formulario.dart';
import 'package:wannakry/formularioexer.dart';
import 'package:flutter/material.dart';
import 'package:wannakry/home_page.dart';
import 'package:wannakry/telacadastrada.dart';
import 'package:wannakry/login.dart';

void main() {
  print("a");

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
        '/HomePage': (context) => const HomePage(),
        '/Formulario': (context) => const Formulario(),
        '/FormExercise': (context) => const FormExercise(),
        '/Login': (context) => const Login(),
        'TelaCadastro': (context) => const TelaCadastro(),
      },
      home: const FormExercise(),
    );
  }
}