import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _productItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(products[index]['title']),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details '),
                onPressed: () => Navigator.pushNamed<bool>(
                    context,'/product/'+ index.toString()
                    )
                    ),
              
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
