// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:wannakry/chores.dart';
import 'package:wannakry/chores_repository.dart';
import 'package:flutter/material.dart';

class ChoreManagement extends StatefulWidget {
  const ChoreManagement({super.key});

  @override
  State<ChoreManagement> createState() => _ChoreManagementState();
}

class _ChoreManagementState extends State<ChoreManagement> {
  String name = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Chore> chores = ChoresRepository.getChores();
  TextEditingController nameController = TextEditingController();
  ChoresRepository choreRepo = ChoresRepository();

  final Chores = ChoresRepository.getChores();

  void init() {
    chores = List.from(Chores);
    super.initState();
  }

  void update() {
    chores = ChoresRepository.getChores();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Chores List: " + chores.length.toString() + " chores")),
      body: Column(children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Please, insert a chore",
                    border: UnderlineInputBorder(),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Chore cannot be empty.";
                    } else if (value.length > 50) {
                      return "Chore name is too long.";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          Chore chore = Chore(name);
                          choreRepo.addChores(chore);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                  "Chore added successfully!",
                                ),
                                duration: Duration(milliseconds: 100)),
                          );
                          update();
                        });
                      }
                    },
                    child: Text("Add chore")),
                SizedBox(
                  height: 400,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(thickness: 2),
                    itemCount: chores.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.announcement_sharp),
                        title: Text(chores[index].name),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      choreRepo.removeChores();
                      update();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Chore removed successfully!",
                          ),
                          duration: Duration(milliseconds: 100),
                        ),
                      );
                    },
                    child: Text("Delete all chores"))
              ],
            ))
      ]),
    );
  }
}
