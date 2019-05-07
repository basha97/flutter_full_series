import 'package:flutter/material.dart';
import 'package:flutter_full_series/pages/auth.dart';
import 'package:flutter_full_series/pages/product.dart';
import 'package:flutter_full_series/pages/products.dart';
import 'package:flutter_full_series/pages/products_admin.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped-models/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  


  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
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
                            AuthPage(),
        '/products': (BuildContext context) =>
                            ProductsPage(model),
        '/admin': (BuildContext context) =>
                            ProductsAdminPage(model),
      },
      onGenerateRoute: (RouteSettings setting){
        final List<String> pathElements = setting.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
                        builder: (BuildContext context) => ProductPage(index));
        }
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) =>
            ProductsPage(model)
          
        );
      },
    ),);
  }
}
