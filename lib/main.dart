import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((element) => element.id == id);
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
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("TODO List App"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTask(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text("TODO List App"),
          );
    final pageBody = SafeArea(
      child: Column(
        children: <Widget>[
          Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Summary(_tasks)),
          Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TasksList(_tasks, _deleteTask)),
        ],
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isAndroid
                ? FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTask(context),
                  )
                : Container(),
          );
  }
}
