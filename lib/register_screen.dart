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
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Idade',
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Cpf',
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
            ),
          ),
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
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirmar senha',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
