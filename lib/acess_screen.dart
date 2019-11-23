import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class AcessScreen extends StatelessWidget {
  void login(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
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
    final mediaQuery = MediaQuery.of(context);
    final usefulHeigh = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: mediaQuery.padding.top,
            ),
            Container(
              padding: EdgeInsets.all(usefulHeigh * 0.1),
              height: usefulHeigh * 0.5,
              child: Image.asset(
                'assets/images/dyva_logo.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: usefulHeigh * 0.5,
              alignment: Alignment.center,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: const Text(
                      'Login',
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () => login(context),
                  ),
                  RaisedButton(
                    child: Text(
                      'Cadastrar',
                    ),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () => register(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
