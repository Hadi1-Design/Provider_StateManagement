import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> tasklist = [];

  List<Map<String, dynamic>> getData() => tasklist;

  Map<String, dynamic> addTask(Map<String, dynamic> task) {
    tasklist.add(task);
    notifyListeners();
    return task;
  }

  void removeTask(Map<String, dynamic> task) {
    tasklist.remove(task);
    notifyListeners();
  }
}
