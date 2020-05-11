import 'package:flutter/material.dart';

void main() {
  runApp(TaskListStart());
}

class TaskListStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "Task Manager", home: TaskList());
  }
}

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TaskListState();
  }
}

class _TaskListState extends State<TaskList> {
  List<Task> _toDoItems = [];

  Widget _buildToDoList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _toDoItems.length) {
        return ListTile(
            title: Text(_toDoItems[index].getTask()),
            subtitle: Text(_toDoItems[index].getDate()),
            trailing: SizedBox(
                width: 40,
                height: 40,
                child: FloatingActionButton(
                    child: Icon(Icons.check_box),
                    onPressed: () => _promptRemoveAlert(index))),
            onTap: () => _promptRemoveAlert(index));
      }
    });
  }

  void _promptRemoveAlert(int index) {
    showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark task "${_toDoItems[index].getTask()}" as done?'),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                _removeToDoItem(index);
                Navigator.of(context).pop();
              },
            )
          ]
        );
      });
  }

  void _addToDoItem(String task, String date) {
    setState(() {
      _toDoItems.add(new Task(task, date));
    });
  }

  void _removeToDoItem(int index) {
    setState(() {
      _toDoItems.removeAt(index);
    });
  }

  void _pushNewAddingScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      var taskController = TextEditingController();
      var dateController = TextEditingController();
      return Scaffold(
          appBar: AppBar(title: Text("Add New Task")),
          body: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/gradient.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 270,
                            child: TextField(
                              autofocus: true,
                              controller: taskController,
                              decoration: InputDecoration(
                                  hintText: "Task",
                                  contentPadding: const EdgeInsets.all(16.0)),
                            ))
                      ]),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 270,
                            child: TextField(
                              autofocus: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                  hintText: "Completion Date",
                                  contentPadding: const EdgeInsets.all(16.0)),
                            ))
                      ]),
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: RaisedButton(
                                onPressed: () {
                                  _addToDoItem(
                                      taskController.text, dateController.text);
                                  taskController.dispose();
                                  dateController.dispose();
                                  Navigator.pop(context);
                                },
                                child: Text("ADD TASK")))
                      ]),
                ],
              )));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mehul\'s Tasks")),
      body: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/gradient.png'), fit: BoxFit.cover),
          ),
          child: Center(
              child: _toDoItems.length == 0
                  ? Text("There are no items to display")
                  : _buildToDoList())),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushNewAddingScreen,
        tooltip: "Add task",
        child: Icon(Icons.add),
      ),
    );
  }
}

class Task {
  String task;
  String date;

  Task(task, date) {
    this.task = task;
    this.date = date;
  }

  String getTask() {
    return this.task;
  }

  String getDate() {
    return this.date;
  }
}
