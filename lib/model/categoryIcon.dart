import 'package:flutter/material.dart';

import '../constants/constants.dart';

class categoryicon extends StatelessWidget {
  String? image;
  String? name;
  categoryicon({
    Key? key,
    this.name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  )
                ]),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    child: Image(fit: BoxFit.fill, image: AssetImage(image!))),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(name!,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  )))
        ],
      ),
    );
  }
}
