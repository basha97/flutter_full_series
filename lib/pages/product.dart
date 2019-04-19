import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final double price;
     

  ProductPage(this.title, this.imageUrl,this.price,this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Chennai,Tamilnadu',
                style: TextStyle(color: Colors.grey),),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
                Text('\$' + price.toString(),
                style: TextStyle(fontSize: 15.0),)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
