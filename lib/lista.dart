// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannakry/user.dart';
import 'package:wannakry/user_repository.dart';

class ListaWanna extends StatefulWidget {
  const ListaWanna({super.key});

  @override
  State<ListaWanna> createState() => _ListaWannaState();
}

class _ListaWannaState extends State<ListaWanna> {
  final userRepo = UserRepository.getUsers();
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancelar"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continuar"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Deseja mesmo excluir este usuário?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  TextEditingController _nomeEdit = new TextEditingController();
  TextEditingController _emailEdit = new TextEditingController();
  TextEditingController _usernameEdit = TextEditingController();
  TextEditingController _idadeEdit = TextEditingController();
  TextEditingController _senhaEdit = TextEditingController();
  String nomeEdit = "";
  String emailEdit = "";
  String usernameEdit = "";
  int idadeEdit = 0;
  String senhaEdit = "";

  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text('Consulta de usuários')),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(thickness: 2),
          itemCount: userRepo.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.person),
                title: Text(userRepo[index].username),
                subtitle: Text(userRepo[index].senha),
                trailing: SizedBox(
                    width: 70,
                    child: Row(
                      children: [
                        Expanded(
                            child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edição de" +
                                        userRepo[index].username +
                                        "."),
                                    content: Form(
                                      key: _formKey2,
                                      child: Column(children: [
                                        TextFormField(
                                            controller: _nomeEdit,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'O nome não pode ser vazio.';
                                              } else {
                                               
                                              }
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
                            
                          }, child: Text("Atualizar"))
                                      ]),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Icons.mode_edit_outline_outlined),
                        )),
                        Expanded(
                            child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Exclusão iminente"),
                                          content: Text(
                                              "Confirma a exclusão deste usuário?"),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  User user = userRepo[index];
                                                  UserRepository.removeUser(
                                                      user);
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Sim")),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancelar"))
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete_forever)))
                      ],
                    )));
          },
        ));
  }
}
