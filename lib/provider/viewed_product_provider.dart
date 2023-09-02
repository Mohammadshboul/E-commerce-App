import 'package:flutter/material.dart';
import 'package:shop_users/models/viewed_product_model.dart';
import 'package:uuid/uuid.dart';

class ViewedProductProvider with ChangeNotifier {
  final Map<String, ViewedProductModel> _viewedProductIterm = {};
  Map<String, ViewedProductModel> get getviewedRecntleyItem {
    return _viewedProductIterm;
  }

  void addProductToHistory({required String productId}) {
    _viewedProductIterm.putIfAbsent(
      productId,
      () => ViewedProductModel(id: const Uuid().v4(), productId: productId),
    );

    notifyListeners();
  }

  void clearLocalViewedProduct() {
    _viewedProductIterm.clear();
    notifyListeners();
  }
}
