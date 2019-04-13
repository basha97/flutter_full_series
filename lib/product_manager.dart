import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';

class Productmanager extends StatefulWidget {
  final String startingProduct ;

  Productmanager(this.startingProduct){
    print('[Productmanager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[Productmanager State] createState()');
    return _ProductmanagerState();
  }
}

class _ProductmanagerState extends State<Productmanager> {
  List<String> _products = [];

  @override
  void initState() {
    print('[Productmanager State] initState()');
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
  void didUpdateWidget(Productmanager oldWidget) {
    print('[Productmanager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('[Productmanager Widget] build()');
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
