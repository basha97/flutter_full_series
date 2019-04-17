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
    return Column(
      children: <Widget>[
        TextField(
          onChanged: (String value){
            setState(() {
              titlevalue = value;
            });
          },
        ),
        TextField(
          maxLines: 4,
          onChanged: (String value){
            setState(() {
              descriptionvalue = value;
            });
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (String value){
            setState(() {
              pricevalue = double.parse(value);
            });
          },
        ),
        Text(titlevalue)
      ],
    );
  }
}
