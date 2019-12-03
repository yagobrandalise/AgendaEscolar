import 'package:appagendaescolar/models/database.dart';
import 'package:appagendaescolar/models/student_task.dart';
import 'package:appagendaescolar/widgets/task_evaluator_list.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list_page.dart';
import '../widgets/user_page.dart';
import '../widgets/new_task_screen.dart';
import '../models/teacher.dart';
import '../models/student.dart';
import '../models/user.dart';

class TaskEvaluatorScreen extends StatefulWidget {
  final List<StudentTask> tasks;

  TaskEvaluatorScreen(this.tasks);

  @override
  _TaskEvaluatorScreenState createState() =>
      _TaskEvaluatorScreenState(this.tasks);
}

class _TaskEvaluatorScreenState extends State<TaskEvaluatorScreen> {
  final List<StudentTask> tasks;

  _TaskEvaluatorScreenState(this.tasks);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          child: TaskEvaluatorList(tasks),
        ),
      ),
    );
  }
}
