import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
  final Function addNewTask;

  NewTask(this.addNewTask);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        timeController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }

    widget.addNewTask(
      title: titleController.text,
      description: descriptionController.text,
      time: double.parse(timeController.text),
      date: _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2021),
    ).then((value) => {
          if (value != null)
            {
              setState(
                () {
                  _selectedDate = value;
                },
              ),
            },
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
                keyboardType: TextInputType.number,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No Date Chosen!"
                          : "Picked date: ${DateFormat("dd-MM-yyyy").format(_selectedDate)}",
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
              RaisedButton(
                child: Text("Add Task"),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
