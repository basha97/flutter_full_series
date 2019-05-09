import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';

enum AuthMode {
  Login,
  Signup
}

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formdata = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  AuthMode _authMode = AuthMode.Login;

  _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/bg.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextController,
      decoration: InputDecoration(labelText: 'Email', filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'fields are empty';
        }
      },
      onSaved: (String value) {
        _formdata['email'] = value;
      },
    );
  }

  

  Widget _buildPasswordTextField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordTextController,
      decoration: InputDecoration(labelText: 'Password', filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'fields are empty';
        }
      },
      onSaved: (String value) {
        _formdata['password'] = value;
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Confirm Password', filled: true),
      validator: (String value) {
        if (_passwordTextController != value) {
          return 'Password doesn\'t match';
        }
      },
      onSaved: (String value) {
        _formdata['password'] = value;
      },
    );
  }

  Widget _buildSwitchTile() {
    return SwitchListTile(
      value: _formdata['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formdata['acceptTerms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm(Function login) {
    if (!_formkey.currentState.validate() || !_formdata['acceptTerms']) {
      return;
    }

    _formkey.currentState.save();
    login(_formdata['email'],_formdata['password']);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
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
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _authMode == AuthMode.Signup ? _buildConfirmPasswordTextField() : Container(),
                    _buildSwitchTile(),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      child: Text('Switch to ${_authMode == AuthMode.Login ? 'SignUp' : 'Login'}'),
                      onPressed: (){
                        setState(() {
                          _authMode = _authMode == AuthMode.Login 
                            ? AuthMode.Signup
                            : AuthMode.Login ;
                        });
                      },
                    ),
                    ScopedModelDescendant<MainModel>(
                      builder: (BuildContext context, Widget child, MainModel model) {
                        return RaisedButton(
                          textColor: Colors.white,
                          child: Text('LOGIN'),
                          onPressed: () => _submitForm(model.login),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
