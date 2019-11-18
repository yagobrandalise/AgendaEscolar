import 'package:flutter/material.dart';
import 'acess_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agenda escolar',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: AcessScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {

//     final appBar = AppBar(title: Text('Agenda escolar'),);
//     return Scaffold(
//       appBar: appBar,
//       body: Center(
//         child: Text("Cadastro"),
//       ),
//     );
//   }
// }
