import 'package:flutter/material.dart';

import './widgets/summary.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];

  void _addNewTask(
      {String title, String description, double time, DateTime date}) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      time: time,
      date: date,
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
          Summary(_tasks),
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
