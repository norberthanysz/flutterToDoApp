import 'package:flutter/material.dart';

import './widgets/tasksList.dart';
import './widgets/newTask.dart';
import './models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  _startAddNewTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTask(_addNewTask);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO List App"),
      ),
      body: Column(
        children: <Widget>[
          TasksList(_tasks),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTask(context),
      ),
    );
  }
}
