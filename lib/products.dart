import 'package:flutter/material.dart';

class Products extends StatelessWidget {

  final List<String> products;

  Products(this.products){
    print('[Products Widget] Constructor');
  }

  Widget _productItem(BuildContext context, int index){
    return Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/food.jpg'),
                    Text(products[index]),
                  ],
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return products.length > 0 ? ListView.builder(
      itemBuilder: _productItem,
      itemCount: products.length,
    ): Center(
      child: Text('No products found'),
    );
  }
}
