// ignore_for_file: unnecessary_this, prefer_final_fields

import 'package:wannakry/tasks.dart';

class TaskRepository {
  List<Task> _listTask = [];

  TaskRepository();

  List<Task> get listTasks => this._listTask; 

  set listTask(List<Task> value) => this._listTask = value;
  
}