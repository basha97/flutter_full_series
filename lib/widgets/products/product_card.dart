import 'package:flutter/material.dart';

import './price_tag.dart';

class ProductCard extends StatelessWidget{
  final Map<String , dynamic> product;
  final int productindex;

  ProductCard(this.product,this.productindex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  product['title'],
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price'].toString())
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                child: Text('Chennai,Tamilnadu'),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + productindex.toString())
                      ),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + productindex.toString())
                      ),
            ],
          )
        ],
      ),
    );
  }
}