import 'package:flutter/material.dart';
import 'package:flutter_full_series/pages/auth.dart';
import 'package:flutter_full_series/pages/product.dart';
import 'package:flutter_full_series/pages/products.dart';
import 'package:flutter_full_series/pages/products_admin.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/main.dart';
import './models/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  final MainModel _model = MainModel();
  @override
  void initState() {
    _model.autoAuthenticate();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        buttonColor: Colors.redAccent
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>
                            ScopedModelDescendant(builder: (BuildContext context,Widget child,MainModel model){
                              return model.user == null ? AuthPage() : ProductsPage(_model);
                            },),
        '/products': (BuildContext context) =>
                            ProductsPage(_model),
        '/admin': (BuildContext context) =>
                            ProductsAdminPage(_model),
      },
      onGenerateRoute: (RouteSettings setting){
        final List<String> pathElements = setting.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final String productId = pathElements[2];
          final Product product = _model.allProducts.firstWhere((Product product){
            return product.id == productId;
          });
          return MaterialPageRoute<bool>(
                        builder: (BuildContext context) => ProductPage(product));
        }
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>
            ProductsPage(_model)
          
        );
      },
    ),);
  }
}
