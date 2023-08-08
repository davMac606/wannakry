import 'package:flutter/material.dart';

class NavBar extends AppBar {
  NavBar(BuildContext context, {super.key, required String title})
      : super(title: Text(title), actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/"),
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/welcome"),
              icon: const Icon(Icons.waving_hand)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/aboutus"),
              icon: const Icon(Icons.people)),
              IconButton(onPressed: () => Navigator.pushNamed(context, "/my_text"), 
              icon: const Icon(Icons.textsms_rounded)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/counter"),
              icon: const Icon(Icons.plus_one))
        ]);
}