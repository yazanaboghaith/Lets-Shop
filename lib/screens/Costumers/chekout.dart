import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lets/classes/cart_class.dart';
import 'package:lets/classes/user_class.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/model/checkoutsinglebutton.dart';
import 'package:lets/model/mybutton.dart';
import 'package:lets/model/notifaction_button.dart';
import 'package:lets/provider/product_provider.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Costumers/history_order.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  Auth? auth = Auth();
  TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  ProductProvider? productProvider;

  Widget _buildBottomSingleDetail({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName!,
          style: myStyle,
        ),
        Text(
          endName!,
          style: myStyle,
        ),
      ],
    );
  }

  User? user;
  double? total;
  List<CartModel>? myList;

  Widget _buildButton() {
    UserModel? userModel = productProvider!.userModel;
    return Column(children: [
      Container(
          height: 50,
          child: Container(
            height: 45,
            width: double.infinity,
            child: MaterialButton(
                child: Text(
                  "Buy",
                  style: TextStyle(color: Colors.white),
                ),
                color: kPrimaryColor,
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
                                  "Please enter your address to deliver your order to"),
                              TextFormField(
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Please enter Address";
                                    }
                                  }),
                                  keyboardType: TextInputType.streetAddress,
                                  controller: auth!.addressController),
                              SizedBox(
                                height: 20,
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                      minWidth: 2,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(fontSize: 10),
                                      )),
                                  MaterialButton(
                                      minWidth: 2,
                                      onPressed: () {
                                        if (_globalKey.currentState!
                                            .validate()) {
                                          if (productProvider!
                                              .getCheckOutModelList
                                              .isNotEmpty) {
                                            var order = FirebaseFirestore
                                                .instance
                                                .collection("Order");

                                            order.add({
                                              "Product": productProvider!
                                                  .getCheckOutModelList
                                                  .map((c) => {
                                                        "ProductName": c.name,
                                                        "ProductPrice": c.price,
                                                        "ProductQuetity":
                                                            c.quentity,
                                                        "ProductImage": c.image,
                                                      })
                                                  .toList(),
                                              "TotalPrice":
                                                  total!.toStringAsFixed(2),
                                              "UserName": userModel!.userName,
                                              "UserEmail": userModel.userEmail,
                                              "UserNumber":
                                                  userModel.userPhoneNumber,
                                              "UserAddress":
                                                  auth!.addressController.text,
                                              "UserId": user!.uid,
                                              "DateOrder": DateFormat(
                                                      'yyyy-MM-dd hh:mm a')
                                                  .format(DateTime.now()),
                                              "OrderStatus": "Waiting"
                                            });
                                            setState(() {
                                              myList!.clear();
                                            });
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Your Order add to waiting List\n Wait to accept your order"),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text("No Item Yet"),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(fontSize: 10),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ));
                      });
                }),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    myList = productProvider!.checkOutModelList;
    productProvider!.checkOutModel;
    user = FirebaseAuth.instance.currentUser!;
    double subTotal = 0;

    productProvider!.getCheckOutModelList.forEach((element) {
      subTotal += element.price! * element.quentity!;
    });

    total = subTotal;
    if (productProvider!.checkOutModelList.isEmpty) {
      total = 0.0;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut Page", style: TextStyle(color: kPrimaryColor)),
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 15),
        child: _buildButton(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: myList!.length,
                  itemBuilder: (ctx, myIndex) {
                    return CheckOutSingleProduct(
                      index: myIndex,
                      image: myList![myIndex].image,
                      name: myList![myIndex].name,
                      price: myList![myIndex].price,
                      quentity: myList![myIndex].quentity,
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _buildBottomSingleDetail(
                      startName: "Total",
                      endName: "\$ ${total!.toStringAsFixed(2)}",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
