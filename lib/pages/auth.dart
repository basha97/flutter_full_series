import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';

import '../models/auth.dart';



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
  final TextEditingController _passwordConfirmTextController =
      TextEditingController();

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
      controller: _passwordConfirmTextController,
      decoration: InputDecoration(labelText: 'Confirm Password', filled: true),
      validator: (String value) {
        print(_passwordTextController);
        if (_passwordTextController.text != value) {
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

  void _submitForm(Function authenticate) async {
    if (!_formkey.currentState.validate() || !_formdata['acceptTerms']) {
      return;
    }
    _formkey.currentState.save();
    Map<String, dynamic> successInformation;
    
       successInformation =
          await authenticate(_formdata['email'], _formdata['password'],_authMode);
    
      if (successInformation['success']) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('An error occured'),
                //content: Text(successInformation['message']),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      
    }
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
                    _authMode == AuthMode.Signup
                        ? _buildConfirmPasswordTextField()
                        : Container(),
                    _buildSwitchTile(),
                    SizedBox(
                      height: 10.0,
                    ),
                    FlatButton(
                      child: Text(
                          'Switch to ${_authMode == AuthMode.Login ? 'SignUp' : 'Login'}'),
                      onPressed: () {
                        setState(() {
                          _authMode = _authMode == AuthMode.Login
                              ? AuthMode.Signup
                              : AuthMode.Login;
                        });
                      },
                    ),
                    ScopedModelDescendant<MainModel>(
                      builder: (BuildContext context, Widget child,
                          MainModel model) {
                        return model.isLoading
                            ? CircularProgressIndicator()
                            : RaisedButton(
                                textColor: Colors.white,
                                child: Text(_authMode == AuthMode.Login
                                    ? 'LOGIN'
                                    : 'SIGNUP'),
                                onPressed: () =>
                                    _submitForm(model.authenticate),
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
