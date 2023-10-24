// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiConfig extends StatefulWidget {
  const ApiConfig({super.key});

  @override
  State<ApiConfig> createState() => _ApiConfigState();
}

class _ApiConfigState extends State<ApiConfig> {
  int userId = 0;
  int taskId = 0;
  String title = "";
  bool completed = false;
   Future<void> getTask() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/10');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = response.body;
      Map<String, dynamic> task = jsonDecode(data);
      print(task);
      userId = (task['userId']);
      taskId = (task['id']);
      title = (task['title']);
      completed = (task['completed']);
      setState(() {

      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Testing'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(onPressed: () {
              getTask();
            }, child: Text('Search specific task')),
            Text('User ID: $userId'),
            Text('Task ID: $taskId'),
            Text('Title: $title'),
            Text('Completed: $completed'),
          ],
        )));
  }
}