import 'package:flutter/material.dart';

import './product_edit.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/connected_product.dart';


class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index , ProductsModel model) {
    
      return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          model.selectProduct(index);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ProductEditPage();
              },
            ),
          );
        },
      );
   
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(model.allProducts[index].title),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.endToStart) {
                model.selectProduct(index);
                model.deleteProduct();
              } else if (direction == DismissDirection.startToEnd) {
                print('Swiped Start to end');
              } else {
                print('Others swiped');
              }
            },
            background: Container(
              color: Colors.redAccent,
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(model.allProducts[index].image),
                  ),
                  title: Text(model.allProducts[index].title),
                  subtitle: Text('\$${model.allProducts[index].price.toString()}'),
                  trailing: _buildEditButton(context, index,model),
                ),
                Divider(),
              ],
            ),
          );
        },
        itemCount: model.allProducts.length,
      );
    });
  }
}
