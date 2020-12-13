import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;

  TasksList(this.tasksList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: tasksList.isEmpty
          ? Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/empty_box.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No tasks to do!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FittedBox(
                              child: Text(
                                "${tasksList[index].time} h",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tasksList[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 250,
                            child: Text(
                              tasksList[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            DateFormat("dd-MM-yyyy")
                                .format(tasksList[index].date),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: tasksList.length,
            ),
    );
  }
}
