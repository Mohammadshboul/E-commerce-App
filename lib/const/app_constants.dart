import 'package:shop_users/models/categories_model.dart';
import 'package:shop_users/services/assets_manager.dart';

class AppConstants {
  static const String productImageUrl =
      "https://cdn.pixabay.com/photo/2014/10/27/19/18/baby-shoes-505471_640.jpg";
  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2
  ];
  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: AssetsManager.mobiles,
      name: "Phones",
      image: AssetsManager.mobiles,
    ),
    CategoryModel(
      id: AssetsManager.shoes,
      name: "Shoes",
      image: AssetsManager.shoes,
    ),
    CategoryModel(
      id: AssetsManager.cosmetics,
      name: "Cosmetics",
      image: AssetsManager.cosmetics,
    ),
    CategoryModel(
      id: AssetsManager.electronics,
      name: "Electronics",
      image: AssetsManager.electronics,
    ),
    CategoryModel(
      id: AssetsManager.book,
      name: "Book",
      image: AssetsManager.book,
    ),
    CategoryModel(
      id: AssetsManager.fashion,
      name: "Fashion",
      image: AssetsManager.fashion,
    ),
    CategoryModel(
      id: AssetsManager.pc,
      name: "Pc",
      image: AssetsManager.pc,
    ),
    CategoryModel(
      id: AssetsManager.watch,
      name: "Watch",
      image: AssetsManager.watch,
    ),
  ];
}
