import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list_page.dart';
import '../widgets/user_page.dart';
import '../widgets/new_task_screen.dart';
import '../models/teacher.dart';
import '../models/student.dart';
import '../models/user.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
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

  static User user = new Student(
      name: "Douglas",
      birthday: DateTime.now(),
      cpf: "1111",
      email: "email@ucs.com",
      id: "@dasda",
      password: "666",
      subjectsIds: <String>["1"],
      registration: "ooo");

  final _widgetsOptions = <Widget>[
    UserPage(user),
    TaskListPage(
      _userTasks,
      user,
    ),
    Center(
      child: Text(
        'Máterias',
      ),
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
