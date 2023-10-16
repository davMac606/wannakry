// ignore_for_file: unnecessary_new, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_final_fields, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, unused_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wannakry/game.dart';
import 'package:wannakry/game_repository.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key});

  @override
  State<AddGame> createState() => _AddGameState();
}

GameRepository gameRepo = new GameRepository();

class _AddGameState extends State<AddGame> {
  TextEditingController _name = TextEditingController();
  TextEditingController _rating = TextEditingController();
  TextEditingController _genre = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _releaseDate = TextEditingController();
  String name = "";
  String rating = "";
  String genre = "";
  int price = 0;
  String releaseDate = "";
  String id = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 100, 100, 100),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add a new game'),
        ),
        body: Center(
          child: Column(
            children: [
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  TextFormField(
                      controller: _name,
                      
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name can't be empty.";
                        } else {}
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:  Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Name',
                        hintText: 'Input the name of the game',
                        border: OutlineInputBorder(),
                      )),
                  TextFormField(
                      controller: _rating,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, imput a rating.';
                        } else if (_rating.text == "E") {
                          return null;
                        } else if (_rating.text == "T") {
                          return null;
                        } else if (_rating.text == "M") {
                          return null;
                        } else if (_rating.text == "RP") {
                          return null;
                        } else {
                          return 'Please, input a valid rating.';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:  Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Rating',
                        hintText: 'Input the game rating',
                        border: OutlineInputBorder(),
                      )),
                  TextFormField(
                    controller: _genre,
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return 'Please, input a genre.';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                        fillColor:  Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Genre',
                        hintText: 'Input the game genre. Ex: RPG, Adventure, Horror.',
                        border: OutlineInputBorder(),
                      )
                  ),
                  TextFormField(
                    controller: _price,
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return 'Please, input a price.';
                      } else if (int.parse(_price.text) <= -1)
                      {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                        fillColor:  Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Price',
                        hintText: "Input the game's price",
                        border: OutlineInputBorder(),
                      )
                  ), 
                  TextFormField(
                    controller: _releaseDate,
                    validator: (value) {
                      if (value == "" || value!.isEmpty) {
                        return 'Please, input a release date.';
                    }
                    },
                    decoration: InputDecoration(
                      filled: true,
                        fillColor:  Color.fromARGB(255, 255, 255, 255),
                        labelText: 'Release Date',
                        hintText: "Input the game's release year",
                        border: OutlineInputBorder(),
                      )
                  ),
                  ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                print(_price.text.trim().split(".")[0]);

                                name = _name.text;
                                rating = _rating.text;
                                genre = _genre.text;
                                price = int.parse(_price.text.trim());
                                releaseDate = _releaseDate.text;
                                Game game = Game(
                                    name, rating, genre, price, releaseDate);
                                gameRepo.addGame(game);
                                setState(() {
                                  _name.text = "";
                                  _rating.text = "";
                                  _genre.text = "";
                                  _price.text = "";
                                  _releaseDate.text = "";
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Game added succesfully.')));
                              });
                              Navigator.pushReplacementNamed(context, '/GameList',
                                  arguments: <String, String>{
                                    'name': _name.text,
                                    'price': _price.text,
                                  });                             
                            }
                          },
                          child: Text("Add"))
                ]))
          ]),
        ));
  }
}
