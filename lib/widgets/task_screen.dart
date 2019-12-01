import 'package:flutter/material.dart';
import '../models/task.dart';
import '../models/user.dart';

class TaskScreen extends StatefulWidget {
  final Task task;
  final User user;

  TaskScreen(this.task, this.user);

  @override
  _TaskScreenState createState() => _TaskScreenState(task, user);
}

class _TaskScreenState extends State<TaskScreen> {
  final Task task;
  final User user;

  _TaskScreenState(this.task, this.user);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
