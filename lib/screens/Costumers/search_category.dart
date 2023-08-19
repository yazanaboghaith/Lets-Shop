import 'package:flutter/material.dart';
import 'package:lets/model/cart_product.dart';
import 'package:lets/screens/Costumers/product_page.dart';
import 'package:provider/provider.dart';

import '../../classes/product_class.dart';
import '../../provider/category_provider.dart';

class SearchCategory extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    List<Product> searchCategory = categoryProvider.searchCategoryList(query);

    return GridView.count(
        childAspectRatio: 0.76,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchCategory
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          image: e.image,
                          name: e.name,
                          price: e.price,
                          des: e.description,
                        ),
                      ),
                    );
                  },
                  child: CartProduct(
                    image: e.image,
                    name: e.name,
                    price: e.price,
                  ),
                ))
            .toList());
  }

  void getProduct() {}
  @override
  Widget buildSuggestions(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    List<Product> searchCategory = categoryProvider.searchCategoryList(query);
    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchCategory
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => DetailScreen(
                          des: e.description,
                          image: e.image,
                          name: e.name,
                          price: e.price,
                        ),
                      ),
                    );
                  },
                  child: CartProduct(
                    image: e.image,
                    name: e.name,
                    price: e.price,
                  ),
                ))
            .toList());
  }
}
