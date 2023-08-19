import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Costumers/chekout.dart';

import '../screens/Both/splash.dart';

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition(start: 25, top: 8),
      badgeContent: Text(
        productProvider!.getCheckOutModelList.length.toString(),
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      badgeColor: Colors.red,
      child: IconButton(
        icon: Icon(
          Icons.shopping_cart_outlined,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CheckOut()));
        },
      ),
    );
  }
}
