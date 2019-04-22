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

  _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/bg.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email', filled: true),
      onChanged: (String value) {
        setState(() {
          _emailvalue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password', filled: true),
      onChanged: (String value) {
        setState(() {
          _passwordvalue = value;
        });
      },
    );
  }

  Widget _buildSwitchTile() {
    return SwitchListTile(
      value: _acceptterms,
      onChanged: (bool value) {
        setState(() {
          _acceptterms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth =  MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 768.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  _buildSwitchTile(),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    
                    textColor: Colors.white,
                    child: Text('LOGIN'),
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
