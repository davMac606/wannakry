// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, empty_statements

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExercise extends StatefulWidget {
  const FormExercise({super.key});

  @override
  State<FormExercise> createState() => _FormExerciseState();
}

class _FormExerciseState extends State<FormExercise> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _idade = TextEditingController();
  TextEditingController _senha = TextEditingController();
  String nome = "";
  String email = "";
  String username = "";
  int idade = 0;
  String senha = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('oi tania!'),
      ),
      body: Center(
        child: Column(children: [
        Text("Bem vindo ao RPIC!", style: TextStyle(fontSize: 20),),
        Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _nome,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O nome não pode ser vazio.';
                } else {
                  if (value.length<3) {
                    return 'O nome deve ter mais de 3 caracteres.';
                  }
                }
                return null;
              } 
            ),
            TextFormField(
              controller: _email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O email não pode ser vazio.';
                } else {
                  if (!value.contains('@')) {
                    return 'O email deve conter @.';
                  }
                }
                return null;
              } 
            ),
            TextFormField(
              controller: _username,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O username não pode ser vazio.';
                } else {
                  if (value.length<3) {
                    return 'O username deve ter mais de 3 caracteres.';
                  }
                }
                return null;
              } 
            ),
            TextFormField(
              controller: _idade,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'A idade não pode ser vazia.';
                } else {
                  if (int.parse(_idade.text)<18) {
                    return 'A idade deve ser maior que 18 anos.';
                  }
                }
                return null;
              } 
            ),
            TextFormField(
              controller: _senha,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'A senha não pode ser vazia.';
                } else {
                  if (value.length<6) {
                    return 'A senha deve ter mais de 6 caracteres.';
                  }
                }
                return null;
              } 
            ),
            ElevatedButton(onPressed: () {

                   void successo() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Aluno cadastrado com sucesso!')));
          }
            setState(() {
              _nome.clear();
              _email.clear();
              _username.clear();
              _senha.clear();
            successo();
            });
            }, child: Text("Cadastrar"))
          
        ],)
        
        )],),
      ));
  }
}