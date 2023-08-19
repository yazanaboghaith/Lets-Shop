import 'package:flutter/material.dart';

import 'package:lets/screens/Admins/order_details_page.dart';

import '../../classes/cart_class.dart';
import '../../classes/order_class.dart';
import '../../constants/constants.dart';
import 'order_deatils_accANDden.dart';

class CartOrder extends StatefulWidget {
  final Order? order;
  final List<CartModel>? products;
  const CartOrder({Key? key, this.order, this.products}) : super(key: key);

  @override
  State<CartOrder> createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => OrderDetailsAccDen(order: widget.order),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecandryColor],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "#${widget.order!.orderId}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Total Products:\n",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            TextSpan(text: "${widget.order!.products!.length}")
                          ],
                        )),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Date Order:\n",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            TextSpan(text: "${widget.order!.dateOrder}")
                          ],
                        )),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Total Price\n",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          TextSpan(text: "${widget.order!.totalPrice}")
                        ],
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
