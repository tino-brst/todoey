import 'package:flutter/material.dart';

class AddTaskModalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(34, 34, 34, 34 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.text,
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'New task',
            ),
            onSubmitted: (value) {
              String result = value.isEmpty ? null : value;
              Navigator.pop<String>(context, result);
            },
          ),
        ],
      ),
    );
  }
}
