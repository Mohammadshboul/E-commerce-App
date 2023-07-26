import 'package:flutter/material.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(color: Colors.grey),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 22,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: TitlesTextWidget(
                            lable: "Total (6 Products/6 Items)")),
                    SubTitleTextWidget(lable: "16.99\$"),
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
