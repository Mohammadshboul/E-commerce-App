import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_users/const/app_constants.dart';
import 'package:shop_users/screens/inner_screens/product_details.dart';
import 'package:shop_users/widget/products/heart_btn.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(context, ProductDetails.routName);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FancyShimmerImage(
                imageUrl: AppConstants.productImageUrl,
                width: double.infinity,
                height: size.height * 0.22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: TitlesTextWidget(
                    lable: "title" * 10,
                    fontSize: 18,
                    maxLines: 2,
                  ),
                ),
                const Flexible(
                    flex: 2,
                    child: HeartButtonWidget(
                      size: 25,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: SubTitleTextWidget(
                      lable: "166\$ ",
                    ),
                  ),
                  Flexible(
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.lightBlue,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.add_shopping_cart_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
