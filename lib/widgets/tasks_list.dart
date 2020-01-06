import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/state/tasks.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context);

    return ListView.builder(
      padding: EdgeInsets.all(24),
      itemCount: tasks.count,
      itemBuilder: (_, index) {
        final task = tasks.list[index];
        return TaskTile(
          title: task.title,
          isDone: task.isDone,
          onChanged: () => tasks.toggle(task),
          onLongPress: () => tasks.remove(task),
        );
      },
    );
  }
}
