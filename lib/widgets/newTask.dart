import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();

  final Function addNewTask;

  NewTask(this.addNewTask);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(labelText: "Description"),
              controller: descriptionController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Estimation time"),
              controller: timeController,
            ),
            FlatButton(
              child: Text("Add Task"),
              textColor: Colors.green,
              onPressed: () {
                addNewTask(
                  title: titleController.text,
                  description: descriptionController.text,
                  time: double.parse(timeController.text),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
