import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shop_users/const/app_constants.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/app_name_text.dart';
import 'package:shop_users/widget/products/latest_arrival.dart';
import 'package:shop_users/widget/title_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.24,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(AppConstants.bannersImages[index]);
                },
                autoplay: true,
                itemCount: AppConstants.bannersImages.length,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.red,
                    color: Colors.white,
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const TitlesTextWidget(
              lable: "Latest arrival",
              fontSize: 22,
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const LatestArrivalProductWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
