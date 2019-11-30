import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String cpf;
  final String email;
  final String password;
  final DateTime birthday;

  User({
    @required this.id,
    @required this.name,
    @required this.cpf,
    @required this.email,
    @required this.password,
    @required this.birthday,
  });
}
