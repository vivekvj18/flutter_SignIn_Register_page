import 'package:firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], 
      appBar: AppBar(
        title: Text ('COVID WELFARE'),
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('LogOut'),
            onPressed: () async{
              await _auth.signOut();

            },
          )
        ],
      ),
      );
  }
}