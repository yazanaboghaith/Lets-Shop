import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lets/screens/Admins/order_page.dart';

import '../../classes/cart_class.dart';
import '../../classes/order_class.dart';
import '../../constants/constants.dart';

class OrderDetails extends StatefulWidget {
  final Order? order;

  OrderDetails({
    this.order,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  List<CartModel> c = [];
  bool isLoading = false;
  TextEditingController denyController = TextEditingController();
  @override
  void initState() {
    c = CartModel.fromJsonArray(widget.order!.products);
    super.initState();
  }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Future aprroveOrder(String a) async {
    setState(() {
      isLoading = true;
    });
    var coll = FirebaseFirestore.instance.collection("Order");

    await coll.get().then((value) => value.docs.forEach((element) {
          if (widget.order!.orderId.toString() == element.id) {
            coll.doc(element.id).update({"OrderStatus": a});
          }
        }));
    setState(() {
      isLoading = false;
    });

    _showMessege("The order has been accepted");
  }

  denyOrder(String denyReason) async {
    var coll = FirebaseFirestore.instance.collection("Order");

    await coll.get().then(
          (value) => value.docs.forEach((element) {
            if (widget.order!.orderId.toString() == element.id) {
              coll.doc(element.id).update({"OrderStatus": "Deny"});
              coll.doc(element.id).update({"reasonrejiction": denyReason});
            }
          }),
        );

    _showMessege("The order was rejected");
  }

  _showMessege(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: kPrimaryColor,
            ))
          : SingleChildScrollView(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("User ID:",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                      Text("#${widget.order!.userId}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: kPrimaryColor)),
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
                                              fontSize: 12,
                                              color: kPrimaryColor)),
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
                                              fontSize: 12,
                                              color: kPrimaryColor)),
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
                                              fontSize: 12,
                                              color: kPrimaryColor))
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.20,
                                            width: double.infinity,
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    "Product ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kPrimaryColor)),
                                                            TextSpan(
                                                                text:
                                                                    "#${index + 1}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        kPrimaryColor))
                                                          ],
                                                        )),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
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
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color:
                                                                          kPrimaryColor)),
                                                              TextSpan(
                                                                  text:
                                                                      "${c[index].name!}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
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
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kPrimaryColor)),
                                                            TextSpan(
                                                                text:
                                                                    "\$${c[index].price.toString()}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
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
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kPrimaryColor)),
                                                            TextSpan(
                                                                text:
                                                                    "${c[index].quentity.toString()}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        kPrimaryColor))
                                                          ],
                                                        )),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 100,
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    kPrimaryColor,
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Price:",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor)),
                                      Text("\$${widget.order!.totalPrice}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: kPrimaryColor)),
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
                                              fontSize: 12,
                                              color: kPrimaryColor)),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await aprroveOrder("Approve");

                                Navigator.pop(context);
                              },
                              child: Text("Accept"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          content: Form(
                                        key: _globalKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                "Please write the reason for rejection"),
                                            TextFormField(
                                                validator: ((value) {
                                                  if (value!.isEmpty) {
                                                    return "Please enter reason for rejection";
                                                  }
                                                }),
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: denyController),
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                MaterialButton(
                                                    minWidth: 2,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                                MaterialButton(
                                                    minWidth: 2,
                                                    onPressed: () {
                                                      if (_globalKey
                                                          .currentState!
                                                          .validate()) {
                                                        setState(() {
                                                          denyOrder(
                                                              denyController
                                                                  .text);
                                                        });
                                                      }
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: ((context) =>
                                                                  OrderPage())));
                                                      setState(() {
                                                        denyController.text =
                                                            "";
                                                      });
                                                    },
                                                    child: Text(
                                                      "Save",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                      ));
                                    });
                              },
                              child: Text("Deny"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                            )
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
