import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/models/product_model.dart';
import 'package:shop_users/provider/viewed_product_provider.dart';
import 'package:shop_users/screens/inner_screens/product_details.dart';
import 'package:shop_users/widget/products/heart_btn.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedProvider.addProductToHistory(productId: productModel.productId);
          await Navigator.pushNamed(
            context,
            ProductDetails.routName,
            arguments: productModel.productId,
          );
        },
        child: SizedBox(
          width: size.width * 0.60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FancyShimmerImage(
                    imageUrl: productModel.productImage,
                    width: size.width * 0.35,
                    height: size.width * 0.35,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlesTextWidget(
                      lable: productModel.productTitle,
                      maxLines: 2,
                      fontSize: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HeartButtonWidget(
                          productId: productModel.productId,
                          size: 22,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                        ),
                      ],
                    ),
                    FittedBox(
                      child: SubTitleTextWidget(
                        lable: "${productModel.productPrice}\$",
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
