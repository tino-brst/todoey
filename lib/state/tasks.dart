import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _list = [
    Task('Finish reading testing guides'),
    Task('Upload app to Github'),
  ];

  UnmodifiableListView<Task> get list {
    return UnmodifiableListView(_list);
  }

  int get count {
    return _list.length;
  }

  int get undoneCount {
    return _list.where((task) => !task.isDone).length;
  }

  String get message {
    if (undoneCount > 1) {
      return '$undoneCount tasks remaining';
    } else if (undoneCount == 1) {
      return 'Just one to go';
    } else {
      return 'All done!';
    }
  }

  void add(String title) {
    _list.add(Task(title));
    notifyListeners();
  }

  void toggle(Task task) {
    task.toggle();
    notifyListeners();
  }

  void remove(Task task) {
    _list.remove(task);
    notifyListeners();
  }
}
