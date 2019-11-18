import 'package:flutter/material.dart';
import 'agenda_screen.dart';

class LoginScreen extends StatelessWidget {
  void login(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AgendaScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
            obscureText: true,
          ),
          RaisedButton(
            child: Text('Logar'),
            onPressed: () => login(context),
          )
        ],
      ),
    );
  }
}
