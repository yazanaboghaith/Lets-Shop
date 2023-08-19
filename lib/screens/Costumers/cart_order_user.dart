import 'package:flutter/material.dart';
import 'package:lets/screens/Costumers/order_details_wait.dart';
import '../../classes/cart_class.dart';
import '../../classes/order_class.dart';
import '../../constants/constants.dart';
import 'order_details_user.dart';

class CartOrderUser extends StatefulWidget {
  final Order? order;
  final List<CartModel>? products;
  final Color? col;
  const CartOrderUser({Key? key, this.order, this.products, this.col})
      : super(key: key);

  @override
  State<CartOrderUser> createState() => _CartOrderUserState();
}

class _CartOrderUserState extends State<CartOrderUser> {
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
                builder: (ctx) => OrderUserDetails(order: widget.order),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  colors: [kSecandryColor, kPrimaryColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: double.infinity,
                    width: 7,
                    color: widget.col,
                  ),
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
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Total Products:\n",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: "${widget.order!.products!.length}")
                          ],
                        )),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Date Order:\n",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
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
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
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
