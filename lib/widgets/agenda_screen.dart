import 'package:appagendaescolar/models/database.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list_page.dart';
import '../widgets/user_page.dart';
import '../widgets/new_task_screen.dart';
import '../models/teacher.dart';
import '../models/student.dart';
import '../models/user.dart';

class AgendaScreen extends StatefulWidget {
  final User user;
  final Database database;

  AgendaScreen(this.user, this.database);

  @override
  _AgendaScreenState createState() =>
      _AgendaScreenState(this.user, this.database);
}

class _AgendaScreenState extends State<AgendaScreen> {
  final User user;
  final Database database;
  final _widgetsOptions = <Widget>[];

  _AgendaScreenState(this.user, this.database) {
    _widgetsOptions.add(UserPage(user, database));
    _widgetsOptions.add(TaskListPage(
      _userTasks,
      user,
    ));
    _widgetsOptions.add(Center(
      child: Text(
        'Máterias',
      ),
    ));
  }

  int _selectedNavigationIndex = 1;
  static List<Task> _userTasks = [
    Task(
      id: 't1',
      title: 'Trabalho fundamentos',
      description:
          'Trabalho de fundamentos que conciste em aplicar as técnicas do scrum',
      date: DateTime.now(),
      dueTime: DateTime.now().add(
        Duration(days: 7),
      ),
      subjectId: "FES",
    ),
    Task(
      id: 't2',
      title: 'Trabalho grafos',
      description: 'Implementar algoritmos de grafos em duas tarefas do UVA',
      date: DateTime.now(),
      dueTime: DateTime.now().add(
        Duration(days: 2),
      ),
      subjectId: "TG",
    ),
    Task(
      id: 't3',
      title: 'Trabalho estruturas de dados',
      description: 'Implementar banco',
      date: DateTime.now(),
      dueTime: DateTime.now().add(
        Duration(days: 10),
      ),
      subjectId: "AED",
    ),
    Task(
      id: 't3',
      title: 'Trabalho estruturas de dados II ',
      description: 'Implementar banco e fazer mineração dos dados',
      date: DateTime.now(),
      dueTime: DateTime.now().add(
        Duration(days: 15),
      ),
      subjectId: "AED",
    ),
    Task(
      id: 't4',
      title: 'Desenvolver Sprint 2 ',
      description: 'Desenvolver tarefas propostas do sprint 2 ',
      date: DateTime.now(),
      dueTime: DateTime.now().subtract(
        Duration(days: 2),
      ),
      subjectId: "FES",
    ),
  ];

  void _onChangeNavigationItem(int index) {
    setState(() {
      _selectedNavigationIndex = index;
    });
  }

  void _createNewTask(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => NewTaskScreen(user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Conta'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Matérias'),
          ),
        ],
        currentIndex: _selectedNavigationIndex,
        onTap: _onChangeNavigationItem,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          child: _widgetsOptions[_selectedNavigationIndex],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: user is Teacher && _selectedNavigationIndex == 1
          ? FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () => _createNewTask(context),
            )
          : null,
    );
  }
}
