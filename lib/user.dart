
class User {
  String _username;
  String _senha;

  User(this._username, this._senha);


  get username => _username;
  get senha => _senha;
  set username(value) => _username = username;
  set senha(value) => _senha = senha;
}