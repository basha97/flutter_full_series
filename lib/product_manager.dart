import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';

class Productmanager extends StatelessWidget {
  
  final List<Map<String, dynamic>> products;
  Productmanager(this.products);


  @override
  Widget build(BuildContext context) {
    print('[Productmanager Widget] build()');
    return Column(
      children: <Widget>[
        Expanded(
          child: Products(products),
        )
      ],
    );
  }
}
