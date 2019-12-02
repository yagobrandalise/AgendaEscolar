import 'dart:math';

import 'package:appagendaescolar/widgets/acess_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/database.dart';
import '../models/student.dart';
import '../models/teacher.dart';
import '../models/user.dart';

class RegisterScreen extends StatefulWidget {
  final Database _database;

  RegisterScreen(this._database);

  @override
  _RegisterScreenState createState() => _RegisterScreenState(this._database);
}

class _RegisterScreenState extends State<RegisterScreen> {
  final Database _database;

  _RegisterScreenState(this._database);

  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  DateTime _selectedDate;
  String _userType = 'Estudante';

  void _register(BuildContext ctx) {
    if (_nameController.text.isEmpty ||
        _birthdayController.text.isEmpty ||
        _cpfController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordController2.text.isEmpty) {
      return;
    }

    if (_passwordController.text != _passwordController2.text) {
      return;
    }

    User newUser = _userType == "Estudante"
        ? Student(
            name: _nameController.text,
            cpf: _cpfController.text,
            email: _emailController.text,
            birthday: _selectedDate,
            password: _passwordController.text,
            subjectsIds: ["1", "2"],
            id: new Random().nextInt(10000).toString(),
            registration: new Random().nextInt(10000).toString())
        : Teacher(
            name: _nameController.text,
            cpf: _cpfController.text,
            email: _emailController.text,
            birthday: _selectedDate,
            password: _passwordController.text,
            subjectsIds: ["1", "2"],
            id: new Random().nextInt(100000000000).toString(),
          );

    if (!_database.AddNewUser(newUser)) return;

    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AcessScreen(_database),
      ),
    );
  }

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
            title: const Text(
              'Cadastro',
            ),
          ),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: constraints.maxHeight * 0.8),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                      controller: _nameController,
                      onSubmitted: (_) => {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Data de nascimento',
                            ),
                            keyboardType: TextInputType.datetime,
                            controller: _birthdayController,
                            onSubmitted: (_) => {},
                            enabled: false,
                          ),
                        ),
                        FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.calendar_today,
                            size: 40,
                          ),
                          onPressed: () => _presentDatePicker(context),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cpf',
                      ),
                      controller: _cpfController,
                      onSubmitted: (_) => {},
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      controller: _emailController,
                      onSubmitted: (_) => {},
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      controller: _passwordController,
                      onSubmitted: (_) => {},
                      obscureText: true,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirmar senha',
                      ),
                      controller: _passwordController2,
                      onSubmitted: (_) => {},
                      obscureText: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DropdownButton<String>(
                          value: _userType,
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          items: <String>[
                            'Estudante',
                            'Professor(a)',
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
                            setState(() {
                              _userType = newValue;
                            });
                          },
                        ),
                        RaisedButton(
                          child: Text('Solicitar Cadastro'),
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).textTheme.button.color,
                          onPressed: () => _register(context),
                        ),
                      ],
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
