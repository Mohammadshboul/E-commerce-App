import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/provider/cart_provider.dart';
import 'package:shop_users/provider/product_provider.dart';
import 'package:shop_users/widget/app_name_text.dart';
import 'package:shop_users/widget/products/heart_btn.dart';
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

    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    final productId = ModalRoute.of(context)!.settings.arguments;
    final getCurrentProduct =
        productProvider.findByProdId(productId!.toString());
    final cartProvider = Provider.of<CartProvider>(context);

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
      body: getCurrentProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrentProduct.productImage,
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
                                getCurrentProduct.productTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            SubTitleTextWidget(
                              lable: "${getCurrentProduct.productPrice}\$ ",
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
                              HeartButtonWidget(
                                productId: getCurrentProduct.productId,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      if (cartProvider.isProductInCart(
                                          productId:
                                              getCurrentProduct.productId)) {
                                        return;
                                      }
                                      cartProvider.addProductToCart(
                                          productID:
                                              getCurrentProduct.productId);
                                    },
                                    icon: Icon(cartProvider.isProductInCart(
                                            productId:
                                                getCurrentProduct.productId)
                                        ? Icons.check
                                        : Icons.add_shopping_cart_rounded),
                                    label: Text(cartProvider.isProductInCart(
                                            productId:
                                                getCurrentProduct.productId)
                                        ? "In Cart "
                                        : "Add to cart"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitlesTextWidget(lable: "About This Item"),
                            SubTitleTextWidget(
                                lable:
                                    "In ${getCurrentProduct.productCategory}")
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SubTitleTextWidget(
                          lable: getCurrentProduct.productDescription,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
