import 'package:flutter/material.dart';

class AgendaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agenda escolar',
        ),
      ),
      body: Center(
        child: Text(
          "agenda page",
        ),
      ),
    );
  }
}
