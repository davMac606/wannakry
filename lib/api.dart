// ignore_for_file: unused_local_variable, avoid_print, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wannakry/task_repository.dart';
import 'dart:convert';

import 'package:wannakry/tasks.dart';

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
  Task myTask = Task();
  TaskRepository taskRepo = TaskRepository();
  Future<void> getAllTasks() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = response.body;
      List task = jsonDecode(data) as List;
      taskRepo.listTask = task.map((task) => Task.fromJson(task)).toList();
      for (var element in taskRepo.listTasks) {
        print(element.title);
      }
    }
  }

    Future<void> getTask() async {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/19');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = response.body;
        Map<String, dynamic> task = jsonDecode(data);
        myTask = Task.fromJson(task);
        setState(() {});
        userId = (task['userId']);
        taskId = (task['id']);
        title = (task['title']);
        completed = (task['completed']);
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
              ElevatedButton(
                  onPressed: () {
                    getTask();
                  },
                  child: Text('Search all tasks')),
              Text("User ID: ${myTask.userId}"),
              Text('Task ID: ${myTask.taskId}'),
              Text('Title: ${myTask.title}'),
              Text('Completed: ${myTask.completed}'),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    
                    separatorBuilder: (context, index) => Divider(thickness: 2,),
                    itemCount: taskRepo.listTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text('Task ID: ' + taskRepo.listTasks[index].taskId.toString()),
                        title: Text(taskRepo.listTasks[index].title),
                        subtitle: Text('User ID: ' + taskRepo.listTasks[index].userId.toString()),
                        trailing: Text(taskRepo.listTasks[index].completed.toString())
                      );
                    },
                    padding: EdgeInsets.all(17),)
                    
              )
            ],
          )));
    }
  }

