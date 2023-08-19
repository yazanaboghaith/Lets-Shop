import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xfff8f8f8),
          centerTitle: true,
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pop(MaterialPageRoute(builder: (ctx) => Pagerouter()));
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About",
                style: TextStyle(
                  fontSize: 40,
                  color: kPrimaryColor,
                ),
              ),
              // Image(
              //   image: AssetImage("images/about.png"),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 360,
                child: Wrap(
                  children: [
                    Text(
                      "Neru My Black Directionary,This App You Can Buy Dress Shirt Shoes Pant And Tie And Many Other Product In Cheap Price, Now Its Time Buy SomeThing",
                      style: TextStyle(fontSize: 22, color: kSecandryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
