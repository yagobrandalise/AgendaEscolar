import 'dart:ffi';

import 'package:flutter/foundation.dart';

class StudentTask {
  final String content;
  final Float score;

  StudentTask({
    @required this.content,
    this.score,
  });
}
