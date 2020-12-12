import 'package:flutter/material.dart';

import './newTask.dart';
import './tasksList.dart';
import '../models/task.dart';

class UserTasks extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserTasks> {
  final List<Task> _tasks = [
    Task(
      id: "1",
      title: "Task1",
      description: "Description to task1",
      time: 0.5,
      date: DateTime.now(),
    ),
    Task(
      id: "2",
      title: "Task2",
      description: "Description to task2",
      time: 2,
      date: DateTime.now(),
    ),
  ];

  void _addNewTask({String title, String description, double time}) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      time: time,
      date: DateTime.now(),
    );

    setState(() {
      _tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTask(_addNewTask),
        TasksList(_tasks),
      ],
    );
  }
}
