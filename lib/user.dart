// ignore_for_file: prefer_final_fields

class User {
  String? _nome;
  String _username;
  String _senha;
  String? _email;
  int? _idade;

  User(this._username, this._senha);
  User.usergeral(
      this._nome, this._username, this._senha, this._email, this._idade);
  User.userupdate(
      this._nome, this._email, this._username, this._idade, this._senha);
  get nome => _nome;
  get username => _username;
  get senha => _senha;
  get email => _email;
  get idade => _idade;
  set nome(value) => _nome = nome;
  set username(value) => _username = username;
  set senha(value) => _senha = senha;
  set email(value) => _email = email;
  set idade(value) => _idade = idade;
}
