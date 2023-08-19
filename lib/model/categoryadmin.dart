import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Categoryadmin extends StatelessWidget {
  String? image;
  String? name;
  Categoryadmin({
    Key? key,
    this.name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(127)),
            gradient: LinearGradient(
                colors: [kPrimaryColor, kSecandryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 40,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image(fit: BoxFit.fill, image: AssetImage(image!)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(name!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
