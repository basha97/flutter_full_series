import 'package:flutter/material.dart';
import './product.dart';

class Products extends StatelessWidget {
  final List<Map<String , String>> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _productItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details '),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductPage(
                      products[index]['title'],
                      products[index]['image']
                    )
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
