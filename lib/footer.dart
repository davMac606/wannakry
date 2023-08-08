import 'package:flutter/material.dart';

class Footer extends BottomNavigationBar {
  Footer(BuildContext context, {super.key})
      : super(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => Navigator.pushNamed(context, "/"),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.waving_hand),
                onPressed: () => Navigator.pushNamed(context, "/welcome"),
              ),
              label: "Welcome",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.people),
                onPressed: () => Navigator.pushNamed(context, "/aboutus"),
              ),
              label: "About Us",
            ),
            BottomNavigationBarItem(icon: IconButton(onPressed: () => Navigator.pushNamed(context, "/my_text"), icon: const Icon(Icons.textsms_rounded)), label: "My Text"),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.plus_one),
                onPressed: () => Navigator.pushNamed(context, "/counter"),
              ),
              label: "Contador",
            ),
          ],
        );
}