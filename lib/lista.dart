// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannakry/chng.dart';
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserEdit(userRepo[index], index);
                            }));
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
