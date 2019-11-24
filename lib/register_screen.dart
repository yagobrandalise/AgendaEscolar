import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'agenda_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();
  DateTime _selectedDate;

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

    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AgendaScreen(),
      ),
    );
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      _birthdayController.text = DateFormat.yMd().format(pickedDate);
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro',
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                ),
                controller: _nameController,
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
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                controller: _passwordController,
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar senha',
                ),
                controller: _passwordController2,
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Cadastrar'),
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
    );
  }
}
