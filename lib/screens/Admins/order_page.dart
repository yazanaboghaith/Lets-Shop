import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets/classes/cart_class.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Admins/cart_order.dart';
import 'package:lets/provider/category_provider.dart';
import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Admins/adminpage_router.dart';
import 'package:lets/screens/Admins/cart_order_wait.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:provider/provider.dart';

import '../../classes/order_class.dart';
import '../Costumers/cart_order_waiting.dart';
import '../../provider/product_provider.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    getCallAllFunction();
    super.initState();
  }

  ProductProvider? productProvider;
  Future<void> getCallAllFunction() async {
    await productProvider!.getOrderWaitingData();
    await productProvider!.getOrderApproveData();
    await productProvider!.getOrderDeniedData();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    List<CartModel> c = [];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, AdminPagerouter.id);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("Order's"),
            bottom: TabBar(tabs: [
              Column(
                children: [
                  Icon(Icons.access_time_sharp),
                  Text(
                      "Waiting (${productProvider!.getorderwaitingList.length})"),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
              Column(
                children: [
                  Icon(Icons.check_circle_outline),
                  Text(
                      "Approved (${productProvider!.getorderapproveList.length})"),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
              Column(
                children: [
                  Icon(Icons.cancel_outlined),
                  Text(
                      "Denied (${productProvider!.getorderdeniedList.length})"),
                  SizedBox(
                    height: 5,
                  )
                ],
              )
            ]),
          ),
          body: TabBarView(children: [
            ListView(
                children: productProvider!.getorderwaitingList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrderWait(
                order: e,
                products: c,
              );
            }).toList()),
            ListView(
                children: productProvider!.getorderapproveList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrder(
                order: e,
                products: c,
              );
            }).toList()),
            ListView(
                children: productProvider!.getorderdeniedList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrder(
                order: e,
                products: c,
              );
            }).toList()),
          ])),
    );
  }
}
