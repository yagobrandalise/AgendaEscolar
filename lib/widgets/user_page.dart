import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/teacher.dart';
import '../widgets/acess_screen.dart';

class UserPage extends StatelessWidget {
  final User user;

  UserPage(this.user);

  void _exit(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AcessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          color: Colors.cyan,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          user is Teacher ? 'Professor(a)' : 'Aluno',
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.title.fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Theme.of(context).accentColor,
                  )
                ],
              ),
              Container(
                child: Text(user.name),
              ),
              Container(
                child: RaisedButton(
                  child: Text('Sair'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: () => _exit(context),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
