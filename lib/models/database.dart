import 'package:appagendaescolar/models/student.dart';
import 'package:appagendaescolar/models/teacher.dart';
import 'package:flutter/material.dart';
import 'user.dart';

class Database {
  final List<User> _users = [
    Teacher(
        name: "Iraci",
        birthday: DateTime.now().subtract(
          Duration(days: 600),
        ),
        cpf: "1234",
        email: "iraci@ucs.br",
        id: "111",
        password: "admin",
        subjectsIds: [
          "1",
          "2",
        ]),
    Student(
        name: "dyva",
        birthday: DateTime.now().subtract(
          Duration(days: 1),
        ),
        cpf: "4321",
        email: "dyva@ucs.br",
        id: "222",
        password: "admin",
        subjectsIds: [
          "1",
          "2",
        ],
        registration: "666"),
  ];

  bool AddNewUser(User user) {
    if (_users.any(
      (u) {
        return u.id == user.id;
      },
    )) return false;

    _users.add(user);
    return true;
  }

  User SelectUser(String email, String password) {
    return _users.firstWhere(
      (u) => u.email == email && u.password == password,
    );
  }
}
