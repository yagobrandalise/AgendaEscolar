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
        title: const Text(
          "Agenda escolar",
        ),
      ),
      body: Center(
        // child: Text("login page"),
        child: FlatButton(
          child: Text(
            'Login',
          ),
          onPressed: () => login(context),
        ),
      ),
    );
  }
}
