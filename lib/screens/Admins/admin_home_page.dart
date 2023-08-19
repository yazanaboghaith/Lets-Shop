import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets/screens/Admins/Add_Products.dart';
import 'package:lets/screens/Admins/Edit_Products.dart';
import 'package:lets/screens/Admins/order_page.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../provider/category_provider.dart';
import '../../provider/product_provider.dart';
import '../Both/home_page.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);
  static String id = "AdminHome";

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final controller = TextEditingController();

  void getCallAllFunction() async {
    categoryProvider!.getShirtData();
    categoryProvider!.getDressData();
    categoryProvider!.getShoesData();
    categoryProvider!.getPantData();
    categoryProvider!.getTieData();
    categoryProvider!.getgalssData();
    categoryProvider!.getWatchData();
    categoryProvider!.getSmartbeltData();
    categoryProvider!.getSmartPhoneData();
    categoryProvider!.getPerfumeData();
    categoryProvider!.getMakeupData();
    categoryProvider!.getLaptopData();

    productProvider!.getOrderWaitingData();
    productProvider!.getOrderApproveData();
    productProvider!.getOrderDeniedData();
    // productProvider!.getHomeFeatureData();

    productProvider!.getUserData();
    // productProvider!.getuserinfo;
    // productProvider!.getadmindata();
    // productProvider!.getcheckadmin;
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Text(""),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text(
            'Admin Page',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.03,
            ),
          ),
          elevation: 4,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddProducts.id);
                  },
                  color: kPrimaryColor,
                  minWidth: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.05,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EditProducts.id);
                  },
                  minWidth: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'Edit Product',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                ),
                Badge(
                  position: BadgePosition(start: 25, top: 8),
                  badgeContent: Text(
                    productProvider!.getorderwaitingList.length.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  badgeColor: Colors.red,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => OrderPage()));
                    },
                    color: kPrimaryColor,
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.05,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

//   appBar: AppBar(
//     title: Text("Admin Panel"),
//   ),
//   drawer: mydrawer(),
//   body: Center(
//     child: Container(
//       child: Text("I'm Admin"),
//     ),
//   ),
// )
//
//
//);
  }
}
