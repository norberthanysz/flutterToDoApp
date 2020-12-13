import 'package:flutter/material.dart';

import '../models/task.dart';

class Summary extends StatelessWidget {
  List<Task> _tasks;

  Summary(this._tasks);

  double get workingHours {
    double totalHours = 0;

    for (var i = 0; i < _tasks.length; i++) {
      var today = DateTime.now();
      if (_tasks[i].date.isBefore(today.add(Duration(days: 6)))) {
        totalHours += _tasks[i].time;
      }
    }
    return totalHours;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Working hours on this week:",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
            ),
          ),
          Text(
            "$workingHours / 40 h",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
