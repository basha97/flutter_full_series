import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formdata = {
    'email' : null,
    'password' : null,
    'acceptTerms' : false
  };
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
      decoration: InputDecoration(labelText: 'Email', filled: true),
      validator: (String value){
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
      decoration: InputDecoration(labelText: 'Password', filled: true),
      validator: (String value){
        if (value.isEmpty) {
          return 'fields are empty';
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

  void _submitForm() {
    if (!_formkey.currentState.validate() || !_formdata['acceptTerms']) {
      return ;
    }
    _formkey.currentState.save();
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
              child: Form(
                key: _formkey,
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
      ),
    );
  }
}
