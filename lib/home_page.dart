// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables,, unused_import

import 'package:flutter/material.dart';
import 'package:wannakry/formulario.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Página inicial'),
        ),
        body: Center(
          child: Column(children: [
            Text(
              "Bom dia Tânia!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Formulario');
                },
                child: Text('Formulário')),
                SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/FormExercise');
                },
                child: Text('Formulário exercício')),
                SizedBox(height: 10),
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Game');
                },
                
              
                child: Text('Game Management')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/GameList');
                }, child: Text('Check games')),
                SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/Tarefas');
              }, child: Text('Chores')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Login');
                },
                child: Text('Login')),
                SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Consulta');
                },
                child: Text('Consulta')),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '/ApiTest');
                }, child: Text('ApiTest')),
          ]),
        ));
  }
}
