import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

import '../scoped-models/connected_product.dart';


mixin UserModel on ConnectedProducts {
  void login(String email, String password) {
    authenticatedUser = User(id: 'sad', email: email, password: password);
  }
}
