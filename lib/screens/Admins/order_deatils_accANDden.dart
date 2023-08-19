import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../classes/cart_class.dart';
import '../../classes/order_class.dart';
import '../../constants/constants.dart';

class OrderDetailsAccDen extends StatefulWidget {
  final Order? order;

  OrderDetailsAccDen({
    this.order,
  });

  @override
  State<OrderDetailsAccDen> createState() => _OrderDetailsAccDenState();
}

class _OrderDetailsAccDenState extends State<OrderDetailsAccDen> {
  List<CartModel> c = [];

  @override
  void initState() {
    getdenyreason();
    c = CartModel.fromJsonArray(widget.order!.products);
    super.initState();
  }

  bool isDeny = false;

  Future<void> getdenyreason() async {
    if (widget.order!.statusOrder == "Deny") {
      setState(() {
        isDeny == true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getdenyreason();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Details Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID Order:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor)),
                          Text("#${widget.order!.orderId}",
                              style: TextStyle(
                                  fontSize: 13, color: kPrimaryColor)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Date Order:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor)),
                          Text("${widget.order!.dateOrder}",
                              style: TextStyle(
                                  fontSize: 13, color: kPrimaryColor)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Info:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          // width: MediaQuery.of(context).size.width * 0.8,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: kPrimaryColor, width: 1),
                          //   borderRadius: BorderRadius.all(Radius.circular(10)),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User ID:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("#${widget.order!.userId}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("User Name:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("${widget.order!.userName}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("User Email:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("${widget.order!.userEmail}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("User Number:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("${widget.order!.userNumber}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product's Info:",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor)),
                        Card(
                          elevation: 5,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.4,
                            // width: MediaQuery.of(context).size.width * 0.8,
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: kPrimaryColor, width: 1),
                            //   borderRadius: BorderRadius.all(Radius.circular(10)),
                            // ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  itemCount: c.length,
                                  itemBuilder: (context, index) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      width: double.infinity,
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text: "Product ",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kPrimaryColor)),
                                                      TextSpan(
                                                          text: "#${index + 1}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  kPrimaryColor))
                                                    ],
                                                  )),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: RichText(
                                                        text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "Product Name: ",
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    kPrimaryColor)),
                                                        TextSpan(
                                                            text:
                                                                "${c[index].name!}",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    kPrimaryColor))
                                                      ],
                                                    )),
                                                  ),
                                                  RichText(
                                                      text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "Product Price: ",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kPrimaryColor)),
                                                      TextSpan(
                                                          text:
                                                              "\$${c[index].price.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  kPrimaryColor))
                                                    ],
                                                  )),
                                                  RichText(
                                                      text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                              "Product Quentity: ",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  kPrimaryColor)),
                                                      TextSpan(
                                                          text:
                                                              "${c[index].quentity.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  kPrimaryColor))
                                                    ],
                                                  )),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: kPrimaryColor,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          c[index]
                                                              .image
                                                              .toString()),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  // scrollDirection: Axis.horizontal,
                                )),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Delivery Info:",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                      Card(
                        elevation: 5,
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Price:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("\$${widget.order!.totalPrice}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Delivery Address:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("${widget.order!.userAddress}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Status Order:",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                Text("${widget.order!.statusOrder}",
                                    style: TextStyle(
                                        fontSize: 12, color: kPrimaryColor)),
                                Visibility(
                                  visible: widget.order!.reasonRejection == null
                                      ? false
                                      : true,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Reason Rejiction:",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                      Text("${widget.order!.reasonRejection}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: kPrimaryColor)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
