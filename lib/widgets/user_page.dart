import 'package:appagendaescolar/models/database.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/teacher.dart';
import '../widgets/acess_screen.dart';

class UserPage extends StatelessWidget {
  final User user;
  final Database database;

  UserPage(this.user, this.database);

  void _exit(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) => AcessScreen(this.database),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            fontWeight:
                                Theme.of(context).textTheme.title.fontWeight,
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
                child: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.title.fontSize,
                    fontWeight: Theme.of(context).textTheme.title.fontWeight,
                  ),
                ),
              ),
              Container(
                child: RaisedButton(
                  child: Text('Sair'),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  onPressed: () => _exit(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
