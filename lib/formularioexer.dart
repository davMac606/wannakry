// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, empty_statements, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannakry/telacadastrada.dart';
import 'package:wannakry/user.dart';
import 'package:wannakry/user_repository.dart';

class FormExercise extends StatefulWidget {
  const FormExercise({super.key});

  @override
  State<FormExercise> createState() => _FormExerciseState();
}

UserRepository userRepo = UserRepository();

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
  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('oi tania!'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Bem vindo ao RPIC!",
                style: TextStyle(fontSize: 20),
              ),
              Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      TextFormField(
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
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            hintText: 'Digite seu Nome',
                            border: OutlineInputBorder(),
                          )),
                      TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'O email não pode ser vazio.';
                            } else {
                              if (!value.contains('@')) {
                                return 'O email deve conter @.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'Digite seu e-mail',
                            border: OutlineInputBorder(),
                          )),
                      TextFormField(
                          controller: _username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'O username não pode ser vazio.';
                            } else {
                              if (value.length < 3) {
                                return 'O username deve ter mais de 3 caracteres.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nome de usuário',
                            hintText: 'Digite seu nome de usuário',
                            border: OutlineInputBorder(),
                          )),
                      TextFormField(
                          controller: _idade,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'A idade não pode ser vazia.';
                            } else {
                              if (int.parse(_idade.text) < 18) {
                                return 'A idade deve ser maior que 18 anos.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Idade',
                            hintText: 'Digite sua idade',
                            border: OutlineInputBorder(),
                          )),
                      TextFormField(
                          controller: _senha,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'A senha não pode ser vazia.';
                            } else {
                              if (value.length < 6) {
                                return 'A senha deve ter mais de 6 caracteres.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            hintText: 'Crie uma senha',
                            border: OutlineInputBorder(),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey1.currentState!.validate()) {
                              setState(() {
                                username = _username.text;
                                nome = _nome.text;
                                email = _email.text;
                                idade = int.parse(_idade.text);
                                senha = _senha.text;
                                User user = User(nome, username, senha, email, idade);
                                userRepo.addUser(user);
                                setState(() {
                                  _username.text = "";
                                  _nome.text = "";
                                  _email.text = "";
                                  _idade.text = "";
                                  _senha.text = "";
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Aluno cadastrado com sucesso!')));
                              });
                              Navigator.pushNamed(context, '/HomePage',
                                  arguments: <String, String>{
                                    'username': _username.text,
                                    'senha': _senha.text,
                                  });
                            }
                          },
                          child: Text("Cadastrar"))
                    ],
                  ))
            ],
          ),
        ));
  }
}
