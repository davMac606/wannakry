// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, empty_statements

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => FormularioState();
}

class FormularioState extends State<Formulario> {
  TextEditingController _ra = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _senha = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String nome = "";
  int ra = 0;
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Formulário'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Bem vindo!',
                style: TextStyle(fontSize: 20),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _ra,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'O RA não pode ser vazio.';
                          } else {
                            if (int.parse(_ra.text) < 10) {
                              return 'O RA deve ter 10 dígitos.';
                            }
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'RA',
                          hintText: 'Digite seu RA',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                          controller: _nome,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O nome não pode ser vazio.';
                            } else {
                              if (_nome.text.length < 5) {
                                return 'O nome deve ter mais de 5 caracteres.';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nome',
                            hintText: 'Digite seu nome',
                            border: OutlineInputBorder(),
                          )),
                      TextFormField(
                          controller: _senha,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma senha.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            hintText: 'Digite sua senha',
                            border: OutlineInputBorder(),
                          )),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ra = int.parse(_ra.text);
                      nome = _nome.text;

                      senha = _senha.text;
                      void successo() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Aluno cadastrado com sucesso!')));
                      }

                      setState(() {
                        _ra.clear();
                        _nome.clear();
                        _senha.clear();
                        successo();
                      });
                    }
                    ;
                  },
                  child: Text('Enviar')),
              Text("Valores digitados: $ra, $nome, $senha")
            ],
          ),
        ));
  }
}
