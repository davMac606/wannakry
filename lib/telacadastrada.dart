import 'package:flutter/material.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oi Tânia!'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Oi Tânia, voce está cadastrada!', style: TextStyle(fontSize: 20),),
            Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bravometal.com%2Ftrole%2F&psig=AOvVaw04Fwfe3ex8KUNBS38O8L0H&ust=1692125302731000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCJjXyI3o3IADFQAAAAAdAAAAABAr")
          ],
        ),
      ),
    );
  }
}