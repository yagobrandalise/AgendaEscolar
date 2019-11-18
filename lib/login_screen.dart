import 'package:flutter/material.dart';
import 'agenda_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  void login(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AgendaScreen(),
      ),
    );
  }

  void register(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => RegisterScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Agenda escolar",
        ),
      ),
      body: Center(
        // child: Text("login page"),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Login',
              ),
              onPressed: () => login(context),
            ),
            RaisedButton(
              child: Text(
                'Register',
              ),
              onPressed: () => register(context),
            ),
          ],
        ),
      ),
    );
  }
}
