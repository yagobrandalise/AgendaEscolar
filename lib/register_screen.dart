import 'package:flutter/material.dart';
import 'agenda_screen.dart';

class RegisterScreen extends StatelessWidget {
 final snackbar = SnackBar(content: Text('Cadastrado com sucesso!'));

  void register(BuildContext ctx) {
    // Scaffold.of(ctx).showSnackBar(snackbar);
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
          'Cadastro',
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
          RaisedButton(
            child: Text('Cadastrar'),
            onPressed: () => register(context),
          )
        ],
      ),
    );
  }
}
