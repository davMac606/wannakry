// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página inicial'),
      ),
      body: Center(
        child: Column(
          children: [
          ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/MyForm');
            }, child: Text('Formulário'))
          ],
        ),
      )
    );
  }
}