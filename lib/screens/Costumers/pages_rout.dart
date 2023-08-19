import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Admins/adminpage_router.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:lets/screens/Costumers/history_order.dart';
import 'package:lets/screens/Costumers/profile_page.dart';

class Pagerouter extends StatefulWidget {
  static String id = 'Pagerouter';
  @override
  _PagerouterState createState() => _PagerouterState();
}

class _PagerouterState extends State<Pagerouter> {
  int selectedPage = 1;
  final _pageOptions = [ProfilePage(), HomePage(), HistoryOrders()];
  bool isLoading = true;
  @override
  void initState() {
    getcheck();
    super.initState();
  }

  Future<void> getcheck() async {
    await productProvider!.getadmindata();
    await productProvider!.getUserData();
    await productProvider!.getOrderUserApproveData();
    await productProvider!.getOrderUserDeniedData();
    await productProvider!.getOrderUserWaitingData();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    getcheck();
    return isLoading
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            )),
          )
        : productProvider!.isAdmin
            ? AdminPagerouter()
            : Scaffold(
                body: _pageOptions[selectedPage],
                bottomNavigationBar: ConvexAppBar.badge(
                  {
                    2: "${productProvider!.getorderUserapproveList.length + productProvider!.getorderUserdeniedList.length}"
                  },
                  badgeMargin: EdgeInsets.only(bottom: 25, left: 25),
                  backgroundColor: kPrimaryColor,
                  items: [
                    TabItem(icon: Icons.person, title: 'Profile'),
                    TabItem(icon: Icons.home, title: 'Home'),
                    TabItem(icon: Icons.history, title: 'History'),
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
