import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda escolar',
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              'cadastro',
            ),
          ),
        ],
      ),
    );
  }
}
