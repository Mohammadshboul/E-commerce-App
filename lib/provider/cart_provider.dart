import 'package:flutter/material.dart';
import 'package:shop_users/models/product_model.dart';
import 'package:shop_users/provider/product_provider.dart';
import 'package:uuid/uuid.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  bool isProductInCart({required String productId}) {
    return _cartItems.containsKey(productId);
  }

  void addProductToCart({required String productID}) {
    _cartItems.putIfAbsent(
      productID,
      () => CartModel(
          cartId: const Uuid().v4(), productId: productID, quantity: 1),
    );
    notifyListeners();
  }

  void updateQuantity({required String productID, required int quantity}) {
    _cartItems.update(
      productID,
      (item) => CartModel(
          cartId: item.cartId, productId: productID, quantity: quantity),
    );
    notifyListeners();
  }

  double getTotla({required ProductProvider productProvider}) {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurrProduct =
          productProvider.findByProdId(value.productId);
      if (getCurrProduct == null) {
        total += 0.0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  int getQuantity() {
    int quantity = 0;
    _cartItems.forEach((key, value) {
      quantity += value.quantity;
    });
    return quantity;
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
