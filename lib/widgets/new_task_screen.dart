import 'package:appagendaescolar/models/teacher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';
import '../models/user.dart';

class NewTaskScreen extends StatefulWidget {
  final User user;

  NewTaskScreen(this.user);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState(user);
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final User user;

  final _birthdayController = TextEditingController();
  DateTime _selectedDate;

  _NewTaskScreenState(this.user);

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _birthdayController.text = DateFormat.yMd().format(pickedDate);
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Nova tarefa',
            ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  controller: _birthdayController,
                                  onSubmitted: (_) => {},
                                  enabled: false,
                                ),
                              ),
                              if (user is Teacher)
                                FlatButton(
                                  textColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 40,
                                  ),
                                  autofocus: false,
                                  onPressed: () => _presentDatePicker(context),
                                ),
                            ],
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
                                'Título:',
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
                              maxLines: null,
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              enabled: user is Teacher,
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
                          DropdownButton<String>(
                            elevation: 16,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                            items: <String>[
                              'Matemática',
                              'Matemática II',
                              'Português',
                              'Português II',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).textTheme.title.color,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .title
                                        .fontSize,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text('Criar tarefa'),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                      onPressed: () => {},
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
