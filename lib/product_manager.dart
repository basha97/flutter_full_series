import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';
import './product_control.dart';

class Productmanager extends StatefulWidget {
  final Map startingProduct ;

  Productmanager({this.startingProduct}){
    print('[Productmanager Widget] Constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('[Productmanager State] createState()');
    return _ProductmanagerState();
  }
}

class _ProductmanagerState extends State<Productmanager> {
  List<Map<String , String>> _products = [];

  @override
  void initState() {
    print('[Productmanager State] initState()');
    super.initState();
    if(widget.startingProduct != null){
      _products.add(widget.startingProduct);
    }
  }

  @override
  void didUpdateWidget(Productmanager oldWidget) {
    print('[Productmanager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String , String> product){
    setState(() {
      _products.add(product); 
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[Productmanager Widget] build()');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct),
        ),
        Expanded(
          child: Products(_products),
        )
      ],
    );
  }
}
