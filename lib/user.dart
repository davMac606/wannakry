
// ignore_for_file: prefer_final_fields

class User {
  String? _nome;
  String _username;
  String _senha;
  int? _idade;

  User(this._nome, this._username, this._senha, this._idade);
  User.userforlogin(this._username, this._senha);
  get nome => _nome;
  get username => _username;
  get senha => _senha;
  get idade => _idade;
  set nome(value) => _nome;
  set username(value) => _username = username;
  set senha(value) => _senha = senha;
  set idade(value) => _idade = idade;
}