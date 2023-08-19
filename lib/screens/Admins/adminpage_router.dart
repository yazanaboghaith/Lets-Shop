import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Both/splash.dart';

class AdminPagerouter extends StatefulWidget {
  static String id = 'AdminPagerouter';
  @override
  _AdminPagerouterState createState() => _AdminPagerouterState();
}

class _AdminPagerouterState extends State<AdminPagerouter> {
  int selectedPage = 1;

  final _pageAdmin = [HomePage(), AdminHome()];

  Future<void> getcheck() async {
    await productProvider!.getadmindata();
    await productProvider!.getOrderApproveData();
    await productProvider!.getOrderDeniedData();
    await productProvider!.getOrderWaitingData();
  }

  @override
  void initState() {
    // getcheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageAdmin[selectedPage],
      bottomNavigationBar: ConvexAppBar.badge(
        {1: "${productProvider!.getorderwaitingList.length}"},
        badgeMargin: EdgeInsets.only(bottom: 25, left: 25),
        backgroundColor: kPrimaryColor,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.admin_panel_settings, title: 'Admin Panel'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) {
          setState(() {
            selectedPage = i;
          });
        },
      ),
    );
  }
}
