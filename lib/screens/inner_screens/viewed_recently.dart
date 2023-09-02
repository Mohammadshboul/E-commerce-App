import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/empty_bag.dart';

import '../../provider/viewed_product_provider.dart';
import '../../services/my_app_method.dart';
import '../../widget/products/product_widget.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  const ViewedRecentlyScreen({super.key});
  static const routName = '/ViewedRecentlyScreen';

  @override
  Widget build(BuildContext context) {
    final viewedProvider = Provider.of<ViewedProductProvider>(context);

    return viewedProvider.getviewedRecntleyItem.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.recent,
                title: "Your viewed recently is empty",
                suptitle:
                    "Looks like you didn't add anything yet to your viewed recently\ngo ahead and start shopping now",
                buttontext: "Shop now"),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  "viewed recently (${viewedProvider.getviewedRecntleyItem.length})"),
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
                            viewedProvider.clearLocalViewedProduct();
                          });
                    },
                    icon: const Icon(IconlyBold.delete))
              ],
            ),
            body: DynamicHeightGridView(
                builder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductWidget(
                      productId: viewedProvider.getviewedRecntleyItem.values
                          .toList()[index]
                          .productId,
                    ),
                  );
                },
                itemCount: viewedProvider.getviewedRecntleyItem.length,
                crossAxisCount: 2),
          );
  }
}
