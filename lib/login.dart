// ignore_for_file: annotate_overrides, prefer_const_constructors, unused_field, prefer_final_fields, override_on_non_overriding_member, unused_import

import 'package:flutter/material.dart';
import 'package:wannakry/formularioexer.dart';
import 'package:wannakry/home_page.dart';
import 'package:wannakry/telacadastrada.dart';
import 'package:wannakry/user_repository.dart';
import 'package:wannakry/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  TextEditingController _username = TextEditingController();
  TextEditingController _senha = TextEditingController();
  UserRepository _userRepository = UserRepository();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  String username = "";
  String senha = "";


  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Bem-vindo novamente!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Form(
              key: formKey1,
              child: Column(
                children: [
                  TextFormField(
                    controller: _username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'O nome de usuário não pode ser vazio.';
                      } else {
                        if (_username.text.length < 5) {
                          return 'O nome de usuário deve ter mais de 5 caracteres.';
                        }
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _senha,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'A senha não pode ser vazia.';
                      } else {
                        if (_senha.text.length < 5) {
                          return 'A senha deve ter mais de 5 caracteres.';
                        }
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey1.currentState!.validate()) {
                            User user = User(username, senha);
                          if (_userRepository.login(user)) {
                            void successo() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login efetuado!')));
                              setState(() {
                                username = _username.text;
                                senha = _senha.text;
                              });
                            }

                            successo();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login inválido!')));
                          }
                        }
                      },
                      child: Text("Cadastrar")),
                ],
              ))
        ]),
      ),
    );
  }
}
