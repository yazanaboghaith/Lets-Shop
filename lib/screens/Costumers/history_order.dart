import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Costumers/cart_order_waiting.dart';
import 'package:lets/screens/Both/splash.dart';

import '../../classes/cart_class.dart';
import '../Admins/cart_order.dart';
import 'cart_order_user.dart';

class HistoryOrders extends StatefulWidget {
  const HistoryOrders({Key? key}) : super(key: key);

  @override
  State<HistoryOrders> createState() => _HistoryOrdersState();
}

class _HistoryOrdersState extends State<HistoryOrders> {
  List<CartModel> c = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("History Order's"),
          centerTitle: true,
          leading: Text(""),
          backgroundColor: kPrimaryColor,
          bottom: TabBar(tabs: [
            Column(
              children: [
                Icon(Icons.access_time_sharp),
                Text(
                    "Waiting (${productProvider!.getorderUserwaitingList.length})"),
                SizedBox(
                  height: 5,
                )
              ],
            ),
            Column(
              children: [
                Icon(Icons.check_circle_outline),
                Text(
                    "Approved (${productProvider!.getorderUserapproveList.length})"),
                SizedBox(
                  height: 5,
                )
              ],
            ),
            Column(
              children: [
                Icon(Icons.cancel_outlined),
                Text(
                    "Denied (${productProvider!.getorderUserdeniedList.length})"),
                SizedBox(
                  height: 5,
                )
              ],
            )
          ]),
        ),
        body: TabBarView(
          children: [
            ListView(
                children: productProvider!.getorderUserwaitingList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrderUserWait(
                order: e,
                products: c,
                col: Colors.amber,
              );
            }).toList()),
            ListView(
                children: productProvider!.getorderUserapproveList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrderUser(
                order: e,
                products: c,
                col: Colors.green,
              );
            }).toList()),
            ListView(
                children: productProvider!.getorderUserdeniedList.map((e) {
              c = CartModel.fromJsonArray(e.products);
              return CartOrderUser(
                order: e,
                products: c,
                col: Colors.red,
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
