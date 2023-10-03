// ignore_for_file: avoid_print, prefer_final_fields

import 'package:wannakry/game.dart';

class GameRepository {
  static List<Game> _games = [];

  void addGame(Game game) {
    print("Adding $game");

    _games.add(game);
  }

  void printGames() {
    print(_games.length);
    for (Game game in _games) {
      print(game);
    }
  }

  List<Game> get getAll => _games;

  static List<Game> getGames() {
    return _games;
  }


  static void removeGame(Game game) {
    _games.remove(game);
  }

  void updateGame(Game game, int index) {
    _games[index].name = game.name;
    _games[index].rating = game.rating;
    _games[index].genre = game.genre;
    _games[index].price = game.price;
    _games[index].releaseDate = game.releaseDate;
  }
}
final gameCont = GameRepository();

