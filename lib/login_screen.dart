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
        backgroundColor: Colors.white,
        actions: <Widget>[
          RaisedButton(
            child: Text('login'),
            onPressed: () => login(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // child: Text("login page"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                'assets/images/dyva_logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text(
                  'Cadastrar',
                ),
                onPressed: () => register(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
