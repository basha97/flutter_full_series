import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];

  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex{
    return _selectedProductIndex;
  }

  Product get selectedProduct{
    if (_selectedProductIndex == null) {
      return null;
    }
    return _products[_selectedProductIndex];
  }

  void addProduct(Product product){
      _products.add(product);
      _selectedProductIndex = null; 
  }

  void updateProduct(Product product){
     _products[_selectedProductIndex] = product;
     _selectedProductIndex = null;
  }

  void deleteProduct(){
     _products.removeAt(_selectedProductIndex);
     _selectedProductIndex = null; 
  }

  void toggleProductFavoriteStatus(){
    final bool isCurrentlyFavorite = selectedProduct.isFavourite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      image: selectedProduct.image,
      price: selectedProduct.price,
      isFavourite: newFavoriteStatus
    );
    _products[selectedProductIndex] = updateProduct;
    _selectedProductIndex = null; 
  }

  void selectProduct(int index){
    _selectedProductIndex = index;
  }
}