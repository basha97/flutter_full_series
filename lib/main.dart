import 'package:flutter/material.dart';
import 'package:flutter_full_series/product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('title'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Productmanager('Food Tester'),
      ),
    );
  }
}
