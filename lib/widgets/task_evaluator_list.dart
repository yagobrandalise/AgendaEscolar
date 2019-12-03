import 'package:appagendaescolar/models/student_task.dart';
import 'package:flutter/material.dart';

class TaskEvaluatorList extends StatelessWidget {
  final List<StudentTask> tasks;

  TaskEvaluatorList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Nenhuma tarefa',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.4,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : LayoutBuilder(
            builder: (ctx, constraints) {
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: constraints.maxHeight * 0.4,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: TextEditingController(
                                      text: tasks[index].content),
                                  maxLines: null,
                                  expands: true,
                                  textAlignVertical: TextAlignVertical.top,
                                  keyboardType: TextInputType.multiline,
                                  enabled: false,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Icon(Icons.note_add),
                                    color: Theme.of(ctx).primaryColor,
                                    textColor:
                                        Theme.of(ctx).textTheme.button.color,
                                    onPressed: () => {},
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                },
              );
            },
          );
  }
}
