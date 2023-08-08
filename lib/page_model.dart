import 'package:flutter/material.dart';
import 'package:wannakry/footer.dart';
import 'package:wannakry/navbar.dart';

class PageModel extends Scaffold {
  PageModel(context, {required String title, Widget? body, super.key})
      : super(
            appBar: NavBar(context, title: title),
            body: body,
            bottomNavigationBar: Footer(context));
}