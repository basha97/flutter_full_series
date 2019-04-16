import 'package:flutter/material.dart';
import './product.dart';

class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _productItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details '),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductPage()
                  )
                  ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildproductlist() {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _productItem,
        itemCount: products.length,
      );
    } else {
      productCard = Container();
    }

    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return _buildproductlist();
  }
}
