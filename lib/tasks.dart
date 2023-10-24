// ignore_for_file: unused_field

class Task {
  int userId = 0;
  int taskId = 0;
  String title = "";
  bool completed = false;

  Task();

  Task.fromJson(Map<String, dynamic> json): 
    userId = json["userId"],
    taskId = json["id"],
    title = json["title"],
    completed = json["completed"];
}

