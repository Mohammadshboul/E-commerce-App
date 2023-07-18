import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shop_users/screens/cart/cart_widget.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/empty_bag.dart';
import 'package:shop_users/widget/title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
                imagePath: AssetsManager.shoppingBasket,
                title: "Your cart is empty",
                suptitle:
                    "Looks like you didn't add anything yet to your cart\ngo ahead and start shopping now",
                buttontext: "Shop now"),
          )
        : Scaffold(
           appBar: AppBar(
        title: const Text("Cart (5)"),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        actions: [IconButton(onPressed: () {
          
        }, icon: const Icon(IconlyBold.delete))],
      ),
            body: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          );
  }
}
