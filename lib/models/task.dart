import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String subjectId;
  final String title;
  final String description;
  final DateTime date;
  final DateTime dueTime;

  Task({
    @required this.id,
    @required this.subjectId,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.dueTime,
  });
}
