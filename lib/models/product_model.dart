import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String productId,
      productPrice,
      productTitle,
      productCategory,
      productDescription,
      productImage,
      productQuantity;

  ProductModel(
      {required this.productId,
      required this.productPrice,
      required this.productTitle,
      required this.productCategory,
      required this.productDescription,
      required this.productImage,
      required this.productQuantity});
}
