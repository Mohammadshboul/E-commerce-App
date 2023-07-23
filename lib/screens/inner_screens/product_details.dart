import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_users/const/app_constants.dart';
import 'package:shop_users/widget/app_name_text.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class ProductDetails extends StatefulWidget {
  static const routName = '/ProductDetails';

  const ProductDetails({super.key});
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          FancyShimmerImage(
            imageUrl: AppConstants.productImageUrl,
            height: size.height * 0.38,
            width: double.infinity,
            boxFit: BoxFit.contain,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Title " * 10,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    const SubTitleTextWidget(
                      lable: "166\$ ",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Colors.teal.shade200,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(IconlyLight.heart),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: kBottomNavigationBarHeight,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart),
                            label: const Text("Add to cart"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitlesTextWidget(lable: "About This Item"),
                    SubTitleTextWidget(lable: "In Phones")
                  ],
                ),
                 const SizedBox(
                  height: 15,
                ),
                SubTitleTextWidget(lable: "Description" * 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
