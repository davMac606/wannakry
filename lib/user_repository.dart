import 'package:wannakry/user.dart';

// ignore_for_file: unused_field, prefer_final_fields, unnecessary_this, avoid_print
class UserRepository {
  List<User> _users = [];

  UserRepository() {
    this._users = [];
  }
  void addUser(User user) {
    print("Adding $user");

    _users.add(user);
  }

  void printUsers() {
    print(_users.length);
    for (User user in _users) {
      print(user);
    }
  }

  bool login(User user) {
    for (var i = 0; i < _users.length; i) {
      if (_users[i].username == user.username &&
          _users[i].senha == user.senha) {
        return true;
      }
    }
    return false;
  }
}
