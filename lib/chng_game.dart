// ignore_for_file: unused_field, prefer_final_fields, unnecessary_new, override_on_non_overriding_member, prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, unused_local_variable, prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';
import 'package:wannakry/game.dart';
import 'package:wannakry/game_repository.dart';

class GameEdit extends StatefulWidget {
  Game game;
  int index;

  GameEdit(this.game, this.index, {super.key});

  @override
  State<GameEdit> createState() => _GameEditState();
}

class _GameEditState extends State<GameEdit> {
  GameRepository gameRepo = new GameRepository();
  @override
  TextEditingController _nameEdit = new TextEditingController();
  TextEditingController _ratingEdit = new TextEditingController();
  TextEditingController _genreEdit = TextEditingController();
  TextEditingController _priceEdit = TextEditingController();
  TextEditingController _releaseDateEdit = TextEditingController();
  String name = "";
  String rating = "";
  String genre = "";
  double price = 0;
  String releaseDate = "";

  GlobalKey<FormState> _formKey1 = new GlobalKey<FormState>();

  void init() {
    _nameEdit.text = widget.game.name;
    _ratingEdit.text = widget.game.rating;
    _genreEdit.text = widget.game.genre;
    _priceEdit.text = widget.game.price.toString();
    _releaseDateEdit.text = widget.game.releaseDate;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 100, 100, 100),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget.game.name + '.')),
        body: Center(
          child: Column(children: [
            Image.network("https://helpdeskgeek.com/wp-content/pictures/2018/12/gamepad.png", width: 200, height: 200),
            SizedBox(height: 20),
            Form(
                key: _formKey1,
                child: Column(
                  children: [
                    TextFormField(
                        controller: _nameEdit,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please, input a valid name.";
                          } else {}
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: "Insert the game's name.",
                          border: OutlineInputBorder(),
                        )),
                    TextFormField(
                        controller: _ratingEdit,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, input a rating from the following: E, T, M, RP';
                          } else if (_ratingEdit.text == "E") {
                            return null;
                          } else if (_ratingEdit.text == "T") {
                            return null;
                          } else if (_ratingEdit.text == "M") {
                            return null;
                          } else if (_ratingEdit.text == "RP") {
                            return null;
                          } else {
                            return 'Please, input a valid rating.';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Rating',
                          hintText:
                              'Please, input a rating from the following: E, T, M, RP',
                          border: OutlineInputBorder(),
                        )),
                    TextFormField(
                        controller: _genreEdit,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return 'Please, imput a genre.';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Genre',
                          hintText:
                              'Input the game genre. Ex: RPG, Adventure, Horror.',
                          border: OutlineInputBorder(),
                        )),
                    TextFormField(
                        controller: _priceEdit,
                        validator: (value) {
                          if (value == "" || value!.isEmpty) {
                            return 'Please, input a price.';
                          } else if (int.parse(_priceEdit.text) <= -1) {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Price',
                          hintText: "Input the game's price",
                          border: OutlineInputBorder(),
                        )),
                    TextFormField(
                        controller: _releaseDateEdit,
                        validator: (value) {
                          if (value == "" || value!.isEmpty) {
                            return 'Please, input a release date.';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Release Date',
                          hintText: "Input the game's release year",
                          border: OutlineInputBorder(),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey1.currentState!.validate()) {
                            String name = _nameEdit.text;
                            String rating = _ratingEdit.text;
                            String genre = _genreEdit.text;
                            int price = int.parse(_priceEdit.text.trim());
                            String releaseDate = _releaseDateEdit.text;
                            Game game = new Game(
                                name, rating, genre, price, releaseDate);
                            GameRepository.getGames()[widget.index] = game;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Game updated succesfully.')));
                            Navigator.pushReplacementNamed(
                                context, "/GameList");
                          }
                        },
                        child: Text("Update"))
                  ],
                )),
          ]),
        ));
  }
}
