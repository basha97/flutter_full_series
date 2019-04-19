import 'package:flutter/material.dart';

import './price_tag.dart';

import '../ui_elements/title_default.dart';

import './address_tag.dart';


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
                TitleDefault(product['title']),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price'].toString())
              ],
            ),
          ),
          AddressTag('Chennai,Tamilnadu'),
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