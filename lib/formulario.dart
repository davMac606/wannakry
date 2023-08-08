// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, empty_statements

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  TextEditingController _ra = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _senha = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nome = "";
  int ra = 0;
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Center(child: Column(
        children: [
          Text('Bem vindo!', style: TextStyle(fontSize: 20),),
          Form(
            key: _formKey,
            child: 
            Column(children: [
            TextFormField(
              controller: _ra,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O RA não pode ser vazio.';
                } else {
                  if (int.parse(_ra.text)<10) {
                    return 'O RA deve ter 10 dígitos.';
                  }
                }
                return null;
              } 
              
               ,
            ), TextFormField(
              controller: _nome,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O nome não pode ser vazio.';
                } else {
                  if (_nome.text.length < 5) {
                    return 'O nome deve ter mais de 5 caracteres.';
                  }
                }
                return null;
              },
            ),
            TextFormField(
              controller: _senha,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma senha.';
                }
                return null;
              },
            ),
            
          ],)),
          ElevatedButton(onPressed: () {
           if (_formKey.currentState!.validate()) {
             ra = int.parse(_ra.text);
            nome = _nome.text;
            senha = _senha.text;
            setState(() {
              _ra.clear();
              _nome.clear();
              _senha.clear();
            
           });
           };

          }, child: Text('Enviar')),
          Text("Valores digitados: $ra, $nome, $senha")
        ],
      ),)
    );
  }
}