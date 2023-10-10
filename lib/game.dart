// ignore_for_file: unnecessary_new, unnecessary_this, recursive_getters, prefer_final_fields, unused_field, unused_element

import 'dart:math';

class Game {
  String _name;
  String _rating;
  String _genre;
  double _price;
  String _releaseDate;
  String _id = genId();

  static String genId() {
    final random = new Random();
    String result = '';
    for (int i = 0; i <= 10; i++) {
      String digit = random.nextInt(10).toString();
      result += digit.toString();
    }
    return result;
  }

  Game(this._name, this._rating, this._genre, this._price, this._releaseDate);
  String get name => _name;
  String get rating => _rating;
  String get genre => _genre;
  double get price => _price;
  String get releaseDate => _releaseDate;
  String get id => _id;

  set name(value) => _name;
  set rating(value) => _rating = rating;
  set genre(value) => _genre = genre;
  set price(value) => _price = price;
  set releaseDate(value) => _releaseDate = releaseDate;
}
