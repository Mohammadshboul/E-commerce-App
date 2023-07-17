import 'package:flutter/material.dart';
import 'package:shop_users/services/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Shop Smart"),
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
    );
  }
}
