import 'package:flutter/material.dart';

import './price_tag.dart';

import '../ui_elements/title_default.dart';

import './address_tag.dart';

import '../../models/product.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../scoped-models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productindex;

  ProductCard(this.product, this.productindex);

  Widget _buildPricerow() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product.price.toString())
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + productindex.toString())),
        ScopedModelDescendant<ProductsModel>(
          builder: (BuildContext context, Widget child, ProductsModel model) {
            return IconButton(
                icon: Icon(model.products[productindex].isFavourite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectProduct(productindex);
                  model.toggleProductFavoriteStatus();
                });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildPricerow(),
          AddressTag('Chennai,Tamilnadu'),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
