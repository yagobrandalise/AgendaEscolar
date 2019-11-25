import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList(this.tasks);

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
        : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('${tasks[index].subjectId}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tasks[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    'Data da entrega: ${DateFormat.yMMMd().format(tasks[index].dueTime)}',
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          color: tasks[index].dueTime.isAfter(DateTime.now())
                              ? Colors.black
                              : Colors.red,
                        ),
                  ),
                  enabled: tasks[index].dueTime.isAfter(DateTime.now()),
                ),
              );
            },
          );
  }
}
