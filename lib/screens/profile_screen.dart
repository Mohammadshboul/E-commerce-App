import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/provider/theme_provider.dart';
import 'package:shop_users/screens/inner_screens/viewed_recently.dart';
import 'package:shop_users/screens/inner_screens/wishlist.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/services/my_app_method.dart';
import 'package:shop_users/widget/app_name_text.dart';
import 'package:shop_users/widget/custom_list_tile.dart';
import 'package:shop_users/widget/subtitle_text.dart';
import 'package:shop_users/widget/title_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TitlesTextWidget(
                  lable: "Please login to have ultimate access"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/1388303488/photo/mountaineers-reaching-out-to-help-each-other-on-steep-rocky-peaks-low-angle-view-stock-photo.jpg?b=1&s=170667a&w=0&k=20&c=kfWVbzlWye-YNMvLDoDF0Y_GKj6mJVyWZwxTyxQ-boE="),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlesTextWidget(lable: "Mohammad AL-Shboul"),
                    SubTitleTextWidget(lable: "shboulmohammed@gmail.com"),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitlesTextWidget(lable: "General"),
                CustomListTile(
                  imagePath: AssetsManager.orderSvg,
                  text: "All order",
                  fun: () {},
                ),
                CustomListTile(
                  imagePath: AssetsManager.wishlistSvg,
                  text: "Wishlist",
                  fun: () async {
                    await Navigator.pushNamed(context, WishListScreen.routName);
                  },
                ),
                CustomListTile(
                  imagePath: AssetsManager.recent,
                  text: "Viewed recently",
                  fun: () async {
                    await Navigator.pushNamed(
                        context, ViewedRecentlyScreen.routName);
                  },
                ),
                CustomListTile(
                  imagePath: AssetsManager.address,
                  text: "Addres",
                  fun: () {},
                ),
                const Divider(),
                const SizedBox(
                  height: 7,
                ),
                const TitlesTextWidget(lable: "Settings"),
                const SizedBox(
                  height: 7,
                ),
                SwitchListTile(
                  secondary: Image.asset(
                    AssetsManager.theme,
                    height: 45,
                  ),
                  title: Text(themeProvider.getIsDarkTheme
                      ? "Light mode"
                      : " Dark mode"),
                  value: themeProvider.getIsDarkTheme,
                  onChanged: (value) {
                    themeProvider.setDarkTheme(themeValue: value);
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () async {
              await  MyAppMethods.showErrorOrWarningDialog(
                  context: context,
                  Subtitle: "Are you sure",
                  fct: () {},
                  isError: false
                );
              },
              icon: const Icon(IconlyLight.logout),
              label: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
