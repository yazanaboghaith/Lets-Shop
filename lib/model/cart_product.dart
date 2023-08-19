import 'package:flutter/material.dart';

import 'package:lets/constants/constants.dart';

class CartProduct extends StatefulWidget {
  final String? image;
  final int? price;
  final String? name;
  const CartProduct({Key? key, this.image, this.name, this.price})
      : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              child: Card(
                elevation: 7,
                child: SizedBox(
                  height: height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shadowColor: kPrimaryColor,
                            elevation: 10,
                            color: Colors.white,
                            child: SizedBox(
                                width: 100,
                                child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(widget.image!))),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.name!,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: kPrimaryColor,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "\$ ${widget.price.toString()}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: kPrimaryColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
