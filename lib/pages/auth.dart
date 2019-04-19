import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
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
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage('assets/bg.jpg'))),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _emailvalue = value;
                    });
                  },
                ),
                SizedBox(height: 10.0,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password',filled: true),
                  onChanged: (String value) {
                    setState(() {
                      _passwordvalue = value;
                    });
                  },
                ),
                SwitchListTile(
                  value: _acceptterms,
                  onChanged: (bool value) {
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
        ),
      ),
    );
  }
}
