import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/acess_screen.dart';
import 'models/database.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda escolar',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.red,
          errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              subtitle: TextStyle(
                fontSize: 18,
              ),
              button: TextStyle(
                fontSize: 25,
              )),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                  ),
                ),
          )),
      home: AcessScreen(Database()),
    );
  }
}
