import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final Map<String , dynamic> _formdata = {
    'title' : null,
    'description' : null,
    'price' : null,
    'image': 'assets/food.jpg'
  };

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      autovalidate: true,
      validator: (String value){
        if(value.isEmpty && value.length < 5){
          return 'This field is required and should be more than five character';
        }
      },
      onSaved: (String value){
        setState(() {
          _formdata['title'] = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      autovalidate: true,
      validator: (String value){
        if(value.isEmpty){
          return 'This field is required';
        }
      },
      maxLines: 4,
      onSaved: (String value){
        setState(() {
          _formdata['description'] = value;
        });
      },
      
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      autovalidate: true,
      validator: (String value){
        if(value.isEmpty){
          return 'This field is required';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value){
        setState(() {
          _formdata['price'] = double.parse(value);
        });
      },
      
    );
  }

  void _submitForm() {
    _formkey.currentState.validate();
    _formkey.currentState.save();
    widget.addProduct(_formdata);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth + 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
          child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
                child: ListView(
             padding: EdgeInsets.all(10.0),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }
}
