import 'package:appagendaescolar/models/student.dart';
import 'package:appagendaescolar/models/student_task.dart';
import 'package:appagendaescolar/widgets/task_evaluator_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  _TaskScreenState(this.task, this.user) {
    _dueTimeController.text = DateFormat.yMd().format(task.dueTime);
    _descriptionController.text = task.description;
    _subjectController.text = task.subjectId;
  }

  final _dueTimeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _subjectController = TextEditingController();

  void _evaluateTasks(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => TaskEvaluatorScreen([
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
          StudentTask(
            content: "Sprint 1 - Cadastro, Banco de Dados, Interface, Documentação, Conta GitHub, Criar Repositório",
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
              title: Text(task.title),
            ),
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: constraints.maxHeight * 0.8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Data de entrega:',
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: _dueTimeController,
                              keyboardType: TextInputType.datetime,
                              onSubmitted: (_) => {},
                              enabled: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Descrição da tarefa:',
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.4,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                controller: _descriptionController,
                                maxLines: null,
                                expands: true,
                                textAlignVertical: TextAlignVertical.top,
                                keyboardType: TextInputType.multiline,
                                enabled: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Máteria:',
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .fontSize,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              controller: _subjectController,
                              keyboardType: TextInputType.datetime,
                              onSubmitted: (_) => {},
                              enabled: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: user is Student
                ? FloatingActionButton.extended(
                    label: Text(
                      'Postar tarefa',
                    ),
                    icon: Icon(
                      Icons.navigation,
                    ),
                    onPressed: () => {},
                  )
                : FloatingActionButton.extended(
                    label: Text(
                      'Avaliar tarefas',
                    ),
                    icon: Icon(Icons.wb_sunny),
                    onPressed: () => _evaluateTasks(context),
                  ));
      },
    );
  }
}
