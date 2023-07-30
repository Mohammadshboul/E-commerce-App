import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/empty_bag.dart';

import '../../widget/products/product_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  final bool isEmpty = false;
  static const routName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.wishlistSvg,
                title: "Your wishlist is empty",
                suptitle:
                    "Looks like you didn't add anything yet to your cart\ngo ahead and start shopping now",
                buttontext: "Shop now"),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Wishlist (5)"),
              leading: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(IconlyBold.delete))
              ],
            ),
            body: DynamicHeightGridView(
                builder: (context, index) {
                  return const ProductWidget();
                },
                itemCount: 20,
                crossAxisCount: 2),
          );
  }
}
