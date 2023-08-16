import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_users/models/product_model.dart';
import 'package:shop_users/provider/product_provider.dart';
import 'package:shop_users/services/assets_manager.dart';
import 'package:shop_users/widget/products/product_widget.dart';
import 'package:shop_users/widget/title_text.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static String routName = "/SearchScreen";

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

  List<ProductModel> productListSearch = [];
  @override
  void dispose() {
    searchTextConroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProduct
        : productProvider.findByCategory(ctgName: passedCategory);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TitlesTextWidget(lable: passedCategory ?? "Search"),
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
        ),
        body: productList.isEmpty
            ? const Center(
                child: TitlesTextWidget(lable: "No products found"),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: searchTextConroller,
                      decoration: InputDecoration(
                        hintText: "Search",
                        filled: true,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            searchTextConroller.clear();
                            FocusScope.of(context).unfocus();
                          },
                          child: const Icon(Icons.clear),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchTextConroller.text);
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchTextConroller.text);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (searchTextConroller.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                          child: TitlesTextWidget(
                        lable: "No resulte found",
                        fontSize: 40,
                      ))
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                          builder: (context, index) {
                            return ProductWidget(
                              productId: searchTextConroller.text.isNotEmpty
                                  ? productListSearch[index].productId
                                  : productList[index].productId,
                            );
                          },
                          itemCount: searchTextConroller.text.isNotEmpty
                              ? productListSearch.length
                              : productList.length,
                          crossAxisCount: 2),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
