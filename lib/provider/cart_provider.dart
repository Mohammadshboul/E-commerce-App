import 'package:flutter/material.dart';
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
}
