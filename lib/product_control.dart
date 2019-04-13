import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            onPressed: () {
              addProduct('Sweet Tester');
            },
            child: Text('Add Products'),
          );
  }
}