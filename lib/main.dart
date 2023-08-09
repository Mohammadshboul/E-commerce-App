import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/const/theme_data.dart';
import 'package:shop_users/provider/theme_provider.dart';
import 'package:shop_users/screens/auth/login.dart';
import 'package:shop_users/screens/auth/register.dart';
import 'package:shop_users/screens/inner_screens/product_details.dart';
import 'package:shop_users/screens/inner_screens/viewed_recently.dart';
import 'package:shop_users/screens/inner_screens/wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(
              isDarktheme: ThemeProvider.getIsDarkTheme, context: context),
          // home: const RootScreen(),
          home: const LoginScreen(),
          routes: {
            ProductDetails.routName: (context) => const ProductDetails(),
            WishListScreen.routName: (context) => const WishListScreen(),
            ViewedRecentlyScreen.routName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
          },
        );
      }),
    );
  }
}
