
import 'package:flutter/widgets.dart';
import 'package:wannakry/user.dart';
// ignore_for_file: unused_field, prefer_final_fields, unnecessary_this, avoid_print
class UserRepository{
  List<User> _users = [];


  UserRepository(){
  this._users = [];
}
void addUser(User user){
  _users.add(user);
}

bool login(User user){
  if(_users.contains(user)){
    return true;
  }else{
    return false;
  }
}
}
