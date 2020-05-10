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
  List<String> toDoItems = [];

  Widget _buildToDoList() {
    return Text("HELLO");
  }

  Widget _addToDoItem() {
    return Text("BRUH");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      body: _buildToDoList(),
      floatingActionButton: FloatingActionButton(onPressed: _addToDoItem, tooltip: "Add task", child: Icon(Icons.add),),
    );
  }
}
