import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('title'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed: () {},
                child: Text('Add Products'),
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/food.jpg'),
                  Text('Food Paradise'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



   