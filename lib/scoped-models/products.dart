import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

import '../scoped-models/connected_product.dart';

mixin ProductsModel on ConnectedProducts {

  
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayedProduct {
    if (_showFavorites) {
      return  products.where((Product product) => product.isFavourite).toList();
      
    }
    return List.from(products);
  }

  int get selectedProductIndex{
    return selProductIndex;
  }

  Product get selectedProduct{
    if (selectedProductIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  

  void updateProduct(String title, String description, String image, double price){
     final Product updatedProduct = Product(
        title: title, 
        description: description, 
        image: image, 
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId
        );
     products[selectedProductIndex] = updatedProduct;
     selProductIndex = null;
     notifyListeners();
  }

  void deleteProduct(){
     products.removeAt(selectedProductIndex);
     selProductIndex = null; 
     notifyListeners();
  }

  void toggleProductFavoriteStatus(){
    final bool isCurrentlyFavorite = selectedProduct.isFavourite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      isFavourite: newFavoriteStatus,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
    );
    products[selectedProductIndex] = updateProduct;
    selProductIndex = null; 
    notifyListeners();
    
  }

  void selectProduct(int index){
    selProductIndex = index;
  }

  bool get displayFavorite{
    return _showFavorites;
  }

  void toggleDisplayMode(){
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}