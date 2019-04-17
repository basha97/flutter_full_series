import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage>{
  String titlevalue;
  String descriptionvalue;
  double pricevalue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Title'
            ),
            onChanged: (String value){
              setState(() {
                titlevalue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Description'
            ),
            maxLines: 4,
            onChanged: (String value){
              setState(() {
                descriptionvalue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Price'
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value){
              setState(() {
                pricevalue = double.parse(value);
              });
            },
          ),
          Text(titlevalue)
        ],
      ),
    );
  }
}
