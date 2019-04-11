import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';

class Productmanager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductmanagerState();
  }
}

class _ProductmanagerState extends State<Productmanager> {
  List<String> _products = ['Food Tester'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _products.add('Advanced Food Tester');
              });
            },
            child: Text('Add Products'),
          ),
        ),
        Products(_products),
      ],
    );
  }
}
