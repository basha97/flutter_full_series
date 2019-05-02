import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/products.dart';

class ProductsPage extends StatelessWidget {
  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<ProductsModel>(builder: (BuildContext context,Widget child,ProductsModel model){
            return IconButton(
            icon: Icon(model.displayFavorite ? Icons.favorite  : Icons.favorite_border),
            onPressed: () {
              model.toggleDisplayMode();
            },
          );
          },)
        ],
      ),
      body: Products(),
    );
  }
}
