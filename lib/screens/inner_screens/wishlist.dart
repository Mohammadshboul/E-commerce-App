import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/provider/wishlist_provider.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/empty_bag.dart';

import '../../services/my_app_method.dart';
import '../../widget/products/product_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const routName = '/WishListScreen';

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.getWishlistItem.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.bagWish,
                title: "Your wishlist is empty",
                suptitle:
                    "Looks like you didn't add anything yet to your Wishlist \ngo ahead and start shopping now",
                buttontext: "Shop now"),
          )
        : Scaffold(
            appBar: AppBar(
              title:
                  Text("Wishlist (${wishlistProvider.getWishlistItem.length})"),
              leading: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(AssetsManager.shoppingCart),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppMethods.showErrorOrWarningDialog(
                        isError: false,
                        context: context,
                        Subtitle: "Remove items",
                        fct: () {
                          wishlistProvider.clearLocalWishlist();
                        });
                  },
                  icon: const Icon(
                    IconlyBold.delete,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
                builder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ProductWidget(
                      productId: wishlistProvider.getWishlistItem.values
                          .toList()[index]
                          .productId,
                    ),
                  );
                },
                itemCount: wishlistProvider.getWishlistItem.length,
                crossAxisCount: 2),
          );
  }
}
