import 'package:flutter/material.dart';
import 'package:shop_users/models/product_model.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/products/product_widget.dart';
import 'package:shop_users/widget/title_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchTextConroller;
  @override
  void initState() {
    super.initState();
    searchTextConroller = TextEditingController();
  }

  @override
  void dispose() {
    searchTextConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(lable: "Search"),
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextConroller,
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        searchTextConroller.clear();
                      },
                      child: const Icon(Icons.clear),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: DynamicHeightGridView(
                    builder: (context, index) {
                      return ProductWidget(
                        image: ProductModel.localProds[index].productImage,
                        title: ProductModel.localProds[index].productTitle,
                        price: ProductModel.localProds[index].productPrice,
                      );
                    },
                    itemCount: ProductModel.localProds.length,
                    crossAxisCount: 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
