import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage>{
  String _emailvalue;
  String _passwordvalue;
  bool _acceptterms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (String value){
                setState(() {
                  _emailvalue = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              onChanged: (String value){
                setState(() {
                  _passwordvalue = value;
                });
              },
            ),
            SwitchListTile(
            value: _acceptterms,
            onChanged: (bool value){
              setState(() {
                _acceptterms = value;
              });
            },
            title: Text('Accept Terms'),
          ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('LOGIN'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        ),
      ),
    );
  }
}
