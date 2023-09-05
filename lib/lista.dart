import 'package:flutter/material.dart';
import 'package:wannakry/user_repository.dart';

class ListaWanna extends StatefulWidget {
  const ListaWanna({super.key});

  @override
  State<ListaWanna> createState() => _ListaWannaState();
}

class _ListaWannaState extends State<ListaWanna> {
  final userRepo = UserRepository.getUsers();

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
                trailing: const Icon(Icons.more_vert),
                onTap: () => {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(userRepo[index].username),
                        content: Column(children: [
                          Text(userRepo[index].senha),
                          Text(userRepo[index].nome),
                          Text(userRepo[index].idade.toString()),
                          Text(userRepo[index].email),

                        ]),
                      );
                    },)
                    }
                  );
                      
          },
        ));
  }
}
