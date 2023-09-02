import 'package:flutter/material.dart';

class ViewedProductModel with ChangeNotifier {
  final String id, productId;

  ViewedProductModel({required this.id, required this.productId});
}
