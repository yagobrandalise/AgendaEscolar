import 'package:flutter/material.dart';
import 'user.dart';

class Teacher extends User {
  List<String> subjectsIds;

  Teacher(
      {@required String id,
      @required String name,
      @required String cpf,
      @required String email,
      @required String password,
      @required DateTime birthday,
      @required this.subjectsIds})
      : super(
          id: id,
          name: name,
          cpf: cpf,
          email: email,
          password: password,
          birthday: birthday,
        );
}
