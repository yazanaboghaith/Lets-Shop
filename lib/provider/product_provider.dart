import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets/classes/admin_class.dart';

import 'package:lets/classes/cart_class.dart';
import 'package:lets/classes/product_class.dart';
import 'package:lets/classes/user_class.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../classes/order_class.dart';

class ProductProvider with ChangeNotifier {
  bool isAdmin = false;

  // List<UserModel> userModelList = [];
  UserModel? userModel;
  AdminModel? adminModel;

  Future<void> getadmindata() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    var adminsnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc("HdvW68QCQ43R51swAQVH")
        .collection("Admins")
        .get();
    adminsnapshot.docs.forEach((element) {
      if (currentUser!.uid == element.data()["AdminId"]) {
        adminModel = AdminModel(
            adminEmail: element.data()["AdminEmail"],
            adminImage: element.data()["AdminImage"],
            adminName: element.data()["AdminName"]);
        isAdmin = true;
      } else {
        isAdmin = false;
      }
    });
  }

  bool get getcheckadmin {
    return isAdmin;
  }

  Future<void> getUserData() async {
    // List<UserModel> newList = [];
    User? currentUser = FirebaseAuth.instance.currentUser;
    var userSnapShot = await FirebaseFirestore.instance
        .collection("Users")
        .doc("HdvW68QCQ43R51swAQVH")
        .collection("Customers")
        .get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser!.uid == element.data()["UserId"]) {
          userModel = UserModel(
              userAddress: element.data()["UserAddress"],
              userImage: element.data()["UserImage"],
              userEmail: element.data()["UserEmail"],
              userGender: element.data()["UserGender"],
              userName: element.data()["UserName"],
              userPhoneNumber: element.data()["UserNumber"]);
          // newList.add(userModel!);
        }
        // userModelList = newList;
      },
    );
  }

  UserModel? get getuserinfo {
    return userModel;
  }

  // List<UserModel> get getUserModelList {
  //   return userModelList;
  // }

  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void modifyquantiti(int quant, int index) {
    checkOutModelList.elementAt(index).quentity = quant;
    notifyListeners();
  }

  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }

  List<CartModel> listfavorite = [];
  CartModel? productfavorite;

  void removefromfavorite(int index) {
    listfavorite.removeAt(index);
    notifyListeners();
  }

  void addtosfavorite({
    int? price,
    String? name,
    String? image,
  }) {
    productfavorite = CartModel(
      price: price,
      name: name,
      image: image,
    );
    listfavorite.add(productfavorite!);
    notifyListeners();
  }

  List<CartModel> get getlistfavorite {
    return List.from(listfavorite);
  }

  List<CartModel> checkOutModelList = [];

  CartModel? checkOutModel;

  void getCheckOutData(
      {int? price, String? name, String? image, int? quentity}) {
    checkOutModel = CartModel(
      price: price,
      name: name,
      image: image,
      quentity: quentity,
    );
    checkOutModelList.add(checkOutModel!);
    print("Item add done");

    notifyListeners();
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  List<Product> feature = [];
  Product? featureData;
  Future<void> getFeatureData() async {
    List<Product> newList = [];
    var featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("TC9W8Ap2DiyXynfh2y3B")
        .collection("featureproduct")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"],
            description: element.data()["description"],
            publicationdate: element.data()["Publication date"]);
        newList.add(featureData!);
      },
    );
    feature = newList;
  }

  List<Product> get getFeatureList {
    return feature;
  }

  List<Product> newAchives = [];
  Product? newAchivesData;
  Future<void> getNewAchiveData() async {
    List<Product> newList = [];
    var achivesSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("TC9W8Ap2DiyXynfh2y3B")
        .collection("newachives")
        .get();
    achivesSnapShot.docs.forEach((element) {
      newAchivesData = Product(
          description: element.data()["description"],
          image: element.data()["image"],
          name: element.data()["name"],
          price: element.data()["price"]);
      newList.add(newAchivesData!);
    });

    newAchives = newList;
  }

  List<Product> get getNewAchiesList {
    return newAchives;
  }

  List<Product> homeFeature = [];

  // Future<void> getHomeFeatureData() async {
  //   List<Product> newList = [];
  //   var featureSnapShot =
  //       await FirebaseFirestore.instance.collection("homefeature").get();
  //   featureSnapShot.docs.forEach(
  //     (element) {
  //       featureData = Product(
  //           image: element.data()["image"],
  //           name: element.data()["name"],
  //           price: element.data()["price"]);
  //       newList.add(featureData!);
  //     },
  //   );
  //   homeFeature = newList;
  //   notifyListeners();
  // }

  List<Product> get getHomeFeatureList {
    return homeFeature;
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }

  late List<Product> searchList;
  void getSearchList({required List<Product> list}) {
    searchList = list;
  }

  List<Product> searchProductList(String query) {
    List<Product> searchShirt = searchList.where((element) {
      return element.name!.toUpperCase().contains(query) ||
          element.name!.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }

  Order? orderdata;

  CartModel? product;
  CartModel? p;
  List<CartModel> products = [];

  List<Order> orderswaiting = [];
  Future<void> getOrderWaitingData() async {
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Waiting") {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    orderswaiting = newList;
    notifyListeners();
  }

  List<Order> get getorderwaitingList {
    return orderswaiting;
  }

  List<Order> ordersapprove = [];
  Future<void> getOrderApproveData() async {
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Approve") {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              statusOrder: element.data()["OrderStatus"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    ordersapprove = newList;
    notifyListeners();
  }

  List<Order> get getorderapproveList {
    return ordersapprove;
  }

  List<Order> ordersdenied = [];
  Future<void> getOrderDeniedData() async {
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Deny") {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              statusOrder: element.data()["OrderStatus"],
              reasonRejection: element.data()["reasonrejiction"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    ordersdenied = newList;
    notifyListeners();
  }

  List<Order> get getorderdeniedList {
    return ordersdenied;
  }

  List<Order> ordersUserwaiting = [];
  Future<void> getOrderUserWaitingData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Waiting" &&
            element.data()["UserId"] == currentUser!.uid) {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    ordersUserwaiting = newList;
    notifyListeners();
  }

  List<Order> get getorderUserwaitingList {
    return ordersUserwaiting;
  }

  List<Order> ordersUserapprove = [];
  Future<void> getOrderUserApproveData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Approve" &&
            element.data()["UserId"] == currentUser!.uid) {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              statusOrder: element.data()["OrderStatus"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    ordersUserapprove = newList;
    notifyListeners();
  }

  List<Order> get getorderUserapproveList {
    return ordersUserapprove;
  }

  List<Order> ordersUserdenied = [];
  Future<void> getOrderUserDeniedData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<Order> newList = [];
    var order = await FirebaseFirestore.instance
        .collection("Order")
        .orderBy("DateOrder")
        .get();
    order.docs.forEach(
      (element) {
        if (element.data()["OrderStatus"] == "Deny" &&
            element.data()["UserId"] == currentUser!.uid) {
          orderdata = Order(
              products: List.from(element.data()["Product"]),
              totalPrice: element.data()["TotalPrice"],
              userName: element.data()["UserName"],
              dateOrder: element.data()["DateOrder"],
              userId: element.data()["UserId"],
              userEmail: element.data()["UserEmail"],
              userNumber: element.data()["UserNumber"],
              userAddress: element.data()["UserAddress"],
              statusOrder: element.data()["OrderStatus"],
              reasonRejection: element.data()["reasonrejiction"],
              orderId: element.id);
          newList.add(orderdata!);
        }
      },
    );
    ordersUserdenied = newList;
    notifyListeners();
  }

  List<Order> get getorderUserdeniedList {
    return ordersUserdenied;
  }
}
