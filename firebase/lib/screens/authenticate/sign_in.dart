import 'package:firebase/services/auth.dart';
import 'package:firebase/services/loading/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {


 final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
bool loading = false;

 // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('SIGN IN TO COVID WELFARE'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          )
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                 hintText: 'EMAIL ID',
                 fillColor: Colors.grey,
                 filled: true,
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 4.0)
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 4.0)
                 ),

               ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                 hintText: 'Password',
                 fillColor: Colors.grey,
                 filled: true,
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 4.0)
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.black, width: 4.0)
                 ),

               ),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    
                    if(result == null) {
                      setState(() {
                        error = 'COULD NOT SIGN IN THESE CREDENTIALS';
                        loading = false;
                      });
                    }
                  }
                  }
                ),
                SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
              ],
              ),
             ),
           ),
    );
  }
}