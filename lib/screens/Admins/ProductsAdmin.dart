import 'package:lets/classes/product_class.dart';
import 'package:lets/model/cart_product_admin.dart';
import 'package:lets/model/notifaction_button.dart';
import 'package:lets/provider/category_provider.dart';
import 'package:lets/provider/product_provider.dart';
import 'package:lets/screens/Admins/Edit_Products.dart';

import 'package:lets/screens/Both/home_page.dart';

import 'package:lets/model/cart_product.dart';

import 'package:flutter/material.dart';
import 'package:lets/screens/Costumers/product_page.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../Costumers/search_product.dart';
import 'Edit_Details.dart';

class ProductsAdmin extends StatefulWidget {
  static String id = "Products_Admin";
  final String? name;
  bool? isCategory = true;
  final List<Product>? snapShot;

  ProductsAdmin({
    this.name,
    this.isCategory,
    this.snapShot,
  });

  @override
  State<ProductsAdmin> createState() => ProductsAdminState();
}

class ProductsAdminState extends State<ProductsAdmin> {
  Widget _buildMyGridView(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      height: 700,
      child: GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9,
        scrollDirection: Axis.vertical,
        children: widget.snapShot!
            .map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => EditDetails(
                            categoryname: widget.name,
                            image: e.image,
                            name: e.name,
                            des: e.description,
                            price: e.price,
                          )));
                },
                child: CartProductAdmin(
                  price: e.price,
                  image: e.image,
                  name: e.name,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  CategoryProvider? categoryProvider;

  ProductProvider? productProvider;

  Widget _buildSearchBar(context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: Colors.black,
      ),
      onPressed: () {
        productProvider!.getSearchList(list: widget.snapShot!);
        showSearch(context: context, delegate: SearchProduct());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name!,
          style: TextStyle(color: kPrimaryColor),
        ),
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => EditProducts(),
                ),
              );
            }),
        actions: <Widget>[
          _buildSearchBar(context),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            _buildMyGridView(context),
          ],
        ),
      ),
    );
  }
}
