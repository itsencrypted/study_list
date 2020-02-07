import 'package:flutter/foundation.dart';
import 'package:study_list/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasks =  [
    Task(name: 'Study 3Box Documentation'),
    Task(name: 'Check Fortmatic website'),
    Task(name: 'Integrate IPFS'),
    Task(name: 'Study Skale Documentation'),
    Task(name: 'Finish implementing OST/Pepo'),
  ];

  UnmodifiableListView<Task> get task {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}