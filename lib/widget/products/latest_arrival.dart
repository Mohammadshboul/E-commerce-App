import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_users/const/app_constants.dart';
import 'package:shop_users/screens/inner_screens/product_details.dart';
import 'package:shop_users/widget/products/heart_btn.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetails.routName);
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
                    imageUrl: AppConstants.productImageUrl,
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
                      lable: "title  " * 10,
                      maxLines: 2,
                      fontSize: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HeartButtonWidget(
                          size: 22,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                        ),
                      ],
                    ),
                    const FittedBox(
                      child: SubTitleTextWidget(
                        lable: "16.99\$",
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
