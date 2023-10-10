// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, annotate_overrides

import 'package:flutter/material.dart';
import 'package:wannakry/chng_game.dart';
import 'package:wannakry/game.dart';
import 'package:wannakry/game_repository.dart';

class GameList extends StatefulWidget {
  const GameList({super.key});

  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  List<Game> games = GameRepository.getGames();
  List<Game> search = [];
  String name = "";
  final gameRepo = GameRepository.getGames();

  void initState() {
    search = List.from(games);
    super.initState();
  }

  void update(String name) {
    search = List.from(games);
    setState(() {
      search = games
          .where((element) =>
              (element.name.toLowerCase().contains(name.toLowerCase())))
          .toList();
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Do you really want to delete this game?"),
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
    //initState();
    return Scaffold(
      appBar: AppBar(title: Text("View games")),
      body: Column(children: [
        TextField(
            decoration: const InputDecoration(
                labelText: "Search game", border: OutlineInputBorder()),
            onChanged: (String gameName) {
              update(gameName);
            }),
        SizedBox(height: 24),
        ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(thickness: 2),
            itemCount: search.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.gamepad),
                title: Text(search[index].name + "\n" + search[index].price.toString()),
                subtitle: Text(search[index].releaseDate),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return GameEdit(search[index], index);
                                }));
                              },
                              icon: Icon(Icons.mode_edit_outline_outlined))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Confirm action"),
                                        content: Text(
                                            "Do you confirm the exclusion of this game?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Game game = gameRepo[index];
                                                GameRepository.removeGame(game);
                                                update(name);
                                                AlertDialog(
                                                    title: Text("System Alert"),
                                                    content: Text(
                                                        "Game deleted succesfully."));
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel"))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.delete_forever)))
                    ],
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
