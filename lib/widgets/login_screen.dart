import 'package:flutter/material.dart';
import 'agenda_screen.dart';
import '../models/database.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  final Database _database;

  LoginScreen(this._database);

  @override
  _LoginScreenState createState() => _LoginScreenState(this._database);
}

class _LoginScreenState extends State<LoginScreen> {
  final Database _database;

  _LoginScreenState(this._database);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(BuildContext ctx) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    User user =
        _database.SelectUser(_emailController.text, _passwordController.text);

    if (user != null)
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (_) => AgendaScreen(user, this._database),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => _login(context),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                controller: _passwordController,
                obscureText: true,
                onSubmitted: (_) => _login(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Logar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () => _login(context),
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
