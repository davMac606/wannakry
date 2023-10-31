// ignore_for_file: avoid_print, unused_import
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wannakry/api.dart';
import 'package:wannakry/cad_game.dart';
import 'package:wannakry/chores_management.dart';
import 'package:wannakry/con_game.dart';
import 'package:wannakry/formulario.dart';
import 'package:wannakry/formularioexer.dart';
import 'package:flutter/material.dart';
import 'package:wannakry/home_page.dart';
import 'package:wannakry/lista.dart';
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
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/Formulario': (context) => const Formulario(),
        '/FormExercise': (context) => const FormExercise(),
        '/Game': (context) => const AddGame(),
        '/GameList': (context) => const GameList(),
        '/Login': (context) => const Login(),
        '/TelaCadastro': (context) => const TelaCadastro(),
        '/Consulta': (context) => const ListaWanna(),
        '/Tarefas': (context) => const ChoreManagement(),
        '/ApiTest': (context) => const ApiConfig(),
      },
      home: const HomePage(),
    );
  }
}
