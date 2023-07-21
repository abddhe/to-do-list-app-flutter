import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "Go to Shopping"),
  ];

  void addTask(Task newTask) {
    if (!tasks.contains(newTask)) {
      tasks.add(newTask);
      notifyListeners();
    }
  }

  void removeTask(Task task) {
    tasks.removeWhere((element) => element.title == task.title);
    notifyListeners();
  }

  void changeDone(Task task, bool isDone) {
    if (tasks.contains(task)) {
      tasks[tasks.indexOf(task)].isDone = isDone;
      notifyListeners();
    }
  }
}
