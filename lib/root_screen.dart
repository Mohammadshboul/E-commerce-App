import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/provider/cart_provider.dart';
import 'package:shop_users/screens/cart/cart_screen.dart';
import 'package:shop_users/screens/home_screen.dart';
import 'package:shop_users/screens/profile_screen.dart';
import 'package:shop_users/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static String routName = "/RootScreen";

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 2,
        height: kBottomNavigationBarHeight,
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag2),
            icon: Badge(
              label: Text("${cartProvider.getCartItems.length}"),
              child: const Icon(
                IconlyLight.bag2,
              ),
            ),
            label: "Cart",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          ),
        ],
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
      ),
    );
  }
}
