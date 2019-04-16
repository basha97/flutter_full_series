import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Text('On the products page '),
        ),
      );
  }
}