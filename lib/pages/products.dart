import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  ProductsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ProductspageState();
  }
}

Widget _buildProductsList(){
  return ScopedModelDescendant(builder: (BuildContext context, Widget child,MainModel model){
    Widget content = Center(child: Text('No Products found'),);
    if (model.displayedProduct.length > 0 && !model.isLoading) {
     content = Products(); 
    }else if(model.isLoading){
      content = CircularProgressIndicator();
    }
    return content;
  },);
}

class _ProductspageState extends State<ProductsPage>{
  @override
  void initState() { 
    super.initState();
    widget.model.fetchProducts();
  }
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
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.displayFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: _buildProductsList(),
    );
  }
}
