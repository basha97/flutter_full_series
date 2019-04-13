import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';

class Productmanager extends StatefulWidget {
  final String startingProduct ;
  Productmanager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductmanagerState();
  }
}

class _ProductmanagerState extends State<Productmanager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

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
