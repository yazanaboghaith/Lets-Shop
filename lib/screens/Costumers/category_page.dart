import 'package:flutter/foundation.dart';
import 'package:lets/classes/product_class.dart';
import 'package:lets/model/notifaction_button.dart';
import 'package:lets/provider/category_provider.dart';
import 'package:lets/provider/product_provider.dart';

import 'package:lets/screens/Both/home_page.dart';

import 'package:lets/model/cart_product.dart';

import 'package:flutter/material.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:lets/screens/Costumers/product_page.dart';
import 'package:lets/screens/Costumers/search_category.dart';
import 'package:lets/screens/Costumers/search_product.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

class List_Product extends StatefulWidget {
  final String? name;
  bool? isCategory = true;
  final List<Product>? snapShot;

  List_Product({
    this.name,
    this.isCategory,
    this.snapShot,
  });

  @override
  State<List_Product> createState() => _List_ProductState();
}

class _List_ProductState extends State<List_Product> {
  List<String> sort = ["By Name", "By Price"];
  String sortDefault = "By Name";
  bool sorted = false;
  List<Product> filteredproducts = [];
  Future sorting(String? item) async {
    if (item == "By Name") {
      filteredproducts.clear;
      filteredproducts = widget.snapShot!;
      filteredproducts.sort((p1, p2) {
        return p1.name!.compareTo(p2.name!);
      });
    } else if (item == "By Price") {
      filteredproducts.clear;
      filteredproducts = widget.snapShot!;
      filteredproducts.sort((p1, p2) {
        return p1.price!.compareTo(p2.price!);
      });
    }
  }

  @override
  void initState() {
    filteredproducts = widget.snapShot!;
    super.initState();
  }

  Widget _buildTopName() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.name!,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 100,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      icon: Icon(Icons.filter_list, color: kPrimaryColor),
                      items: sort
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (String? item) => setState(() {
                            sortDefault = item!;
                            sorted = true;

                            sorting(sortDefault);
                          })),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyGridView(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9,
            scrollDirection: Axis.vertical,
            children: filteredproducts
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                                image: e.image,
                                name: e.name,
                                price: e.price,
                                des: e.description,
                              )));
                    },
                    child: CartProduct(
                      price: e.price,
                      image: e.image,
                      name: e.name,
                    ),
                  ),
                )
                .toList()));
  }

  Widget _buildSearchBar(context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        color: kPrimaryColor,
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
        backgroundColor: Colors.white,
        elevation: 5.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (ctx) => Pagerouter(),
                ),
              );
              setState(() {
                filteredproducts = widget.snapShot!;
              });
            }),
        actions: <Widget>[
          _buildSearchBar(context),
          Visibility(
              visible: !(productProvider!.isAdmin),
              child: NotificationButton()),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            _buildTopName(),
            SizedBox(
              height: 10,
            ),
            _buildMyGridView(context),
          ],
        ),
      ),
    );
  }
}
