import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/state/tasks.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() => runApp(Todoey());

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (_) => Tasks(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
