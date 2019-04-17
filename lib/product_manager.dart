import 'package:flutter/material.dart';
import 'package:flutter_full_series/products.dart';
import './product_control.dart';

class Productmanager extends StatelessWidget {
  
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;
  Productmanager(this.addProduct,this.deleteProduct,this.products);


  @override
  Widget build(BuildContext context) {
    print('[Productmanager Widget] build()');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded(
          child: Products(products,deleteProduct: deleteProduct),
        )
      ],
    );
  }
}
