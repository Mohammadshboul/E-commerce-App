import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

import '../../provider/cart_provider.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: TitlesTextWidget(
                            lable:
                                "Total (${cartProvider.getCartItems.length}  Products/${cartProvider.getCartItems.length} Items)")),
                    const SubTitleTextWidget(lable: "16.99\$"),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Checkout"))
            ],
          ),
        ),
      ),
    );
  }
}
