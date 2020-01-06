import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final void Function() onChanged;
  final void Function() onLongPress;

  TaskTile({
    @required this.title,
    @required this.isDone,
    @required this.onChanged,
    @required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = TextStyle(decoration: isDone ? TextDecoration.lineThrough : null);

    return ListTile(
      onLongPress: onLongPress,
      contentPadding: EdgeInsets.only(left: 10),
      title: Text(title, style: titleTextStyle),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
        value: isDone,
        onChanged: (_) => onChanged(),
      ),
    );
  }
}
