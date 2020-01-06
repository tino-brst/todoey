import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/state/tasks.dart';
import 'package:todoey/widgets/add_task_modal.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    tasks.message,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 32),
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          final String newTaskTitle = await showModalBottomSheet<String>(
            context: context,
            builder: (_) => AddTaskModalContent(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          );

          if (newTaskTitle != null) tasks.add(newTaskTitle);
        },
      ),
    );
  }
}
