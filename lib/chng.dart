// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field, prefer_const_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannakry/user.dart';
import 'package:wannakry/user_repository.dart';
import 'package:wannakry/lista.dart';

class UserEdit extends StatefulWidget {
  User user;
  int index;

  UserEdit(this.user, this.index, {super.key});
  

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  
  UserRepository userRepo = new UserRepository();
  @override
  TextEditingController _nomeEdit = new TextEditingController();
  TextEditingController _emailEdit = new TextEditingController();
  TextEditingController _usernameEdit = TextEditingController();
  TextEditingController _idadeEdit = TextEditingController();
  TextEditingController _senhaEdit = TextEditingController();
  String nome = "";
  String email = "";
  String username = "";
  int idade = 0;
  String senha = "";

  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  void init() {
    _nomeEdit.text = widget.user.nome;
    _emailEdit.text = widget.user.email;
    _usernameEdit.text = widget.user.username;
    _idadeEdit.text = widget.user.idade.toString();
    _senhaEdit.text = widget.user.senha; 
  }
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Consulta de ' + widget.user.nome + '.')),
      body:
      Form(
      key: _formKey2,
      child: Column(children: [
        TextFormField(
            controller: _nomeEdit,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O nome não pode ser vazio.';
              } else {}
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Nome',
              hintText: 'Digite seu Nome',
              border: OutlineInputBorder(),
            )),
        TextFormField(
            controller: _emailEdit,
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
            controller: _usernameEdit,
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
            controller: _idadeEdit,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'A idade não pode ser vazia.';
              } else {
                if (int.parse(_idadeEdit.text) < 18) {
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
            controller: _senhaEdit,
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
        ElevatedButton(onPressed: () {
          if (_formKey2.currentState!.validate()) {
            String nome = _nomeEdit.text;
            String email = _emailEdit.text;
            String username = _usernameEdit.text;
            int idade = int.parse(_idadeEdit.text);
            String senha = _senhaEdit.text;
            User user = new User.userupdate(nome,email,username,idade,senha);
            UserRepository.getUsers()[widget.index] = user;
          }
        }, child: Text("Atualizar"))
      ]),
    ));
  }
}
