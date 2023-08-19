import 'package:flutter/material.dart';

class CartModel {
  final String? name;
  final String? image;
  final int? price;
  int? quentity;

  CartModel({
    @required this.price,
    @required this.name,
    @required this.image,
    @required this.quentity,
  });
  static List<CartModel> fromJsonArray(List<dynamic>? data) {
    List<CartModel> products = [];
    data!.forEach((element) {
      String name = element["ProductName"];
      int price = element["ProductPrice"];
      String image = element["ProductImage"];
      int quetity = element["ProductQuetity"];

      CartModel prod =
          CartModel(image: image, name: name, price: price, quentity: quetity);
      products.add(prod);
    });

    return products;
  }

  set quan(int q) {
    quentity = q;
  }
}
