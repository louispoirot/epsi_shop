import 'package:epsi_shop/bo/product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final ListProducts = <Product>[];

  List<Product> getAll() {
    return List.unmodifiable(ListProducts);
  }

  void addProduct(Product product) {
    ListProducts.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    ListProducts.remove(product);
    notifyListeners();
  }

  int getProductCount() {
    return ListProducts.length;
  }

  double get totalPriceHt =>
      ListProducts.fold(0, (total, product) => total + product.price);

  double get totalPriceTtc => totalPriceHt * 1.2;
}
