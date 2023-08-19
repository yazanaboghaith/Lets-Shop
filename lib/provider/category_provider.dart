import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lets/classes/product_class.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  Product? shirtData;
  List<Product> dress = [];
  Product? dressData;
  List<Product> shoes = [];
  Product? shoesData;
  List<Product> pant = [];
  Product? pantData;
  List<Product> tie = [];
  Product? tieData;
  List<Product> glass = [];
  Product? glassData;
  List<Product> handbag = [];
  Product? handbagData;
  List<Product> headphone = [];
  Product? headphoneData;
  List<Product> highheels = [];
  Product? highheelsData;
  List<Product> laptop = [];
  Product? laptopData;
  List<Product> makeup = [];
  Product? makeupData;
  List<Product> perfume = [];
  Product? perfumeData;
  List<Product> smartbelt = [];
  Product? smartbeltData;
  List<Product> smartphone = [];
  Product? smartphoneData;
  List<Product> watch = [];
  Product? watchData;

  Future<void> getShirtData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("shirt")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(shirtData!);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future<void> getDressData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("dress")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(shirtData!);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getDressList {
    return dress;
  }

  Future<void> getShoesData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("shoes")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(shirtData!);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getshoesList {
    return shoes;
  }

  Future<void> getPantData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("pant")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(shirtData!);
      },
    );
    pant = newList;
    notifyListeners();
  }

  List<Product> get getPantList {
    return pant;
  }

  Future<void> getTieData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("tie")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(shirtData!);
      },
    );
    tie = newList;
    notifyListeners();
  }

  List<Product> get getTieList {
    return tie;
  }

  Future<void> getgalssData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("glass")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        glassData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(glassData!);
      },
    );
    glass = newList;
    notifyListeners();
  }

  List<Product> get getGlassList {
    return glass;
  }

  Future<void> getHandbagData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("handbag")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        handbagData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(handbagData!);
      },
    );
    handbag = newList;
    notifyListeners();
  }

  List<Product> get getHandbagList {
    return handbag;
  }

  Future<void> getHeadphoneData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("headphone")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        headphoneData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(headphoneData!);
      },
    );
    headphone = newList;
    notifyListeners();
  }

  List<Product> get getHeadphoneList {
    return headphone;
  }

  Future<void> getHighheelsData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("highheels")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        highheelsData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(highheelsData!);
      },
    );
    highheels = newList;
    notifyListeners();
  }

  List<Product> get getHighheelsList {
    return highheels;
  }

  Future<void> getLaptopData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("laptop")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        laptopData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(laptopData!);
      },
    );
    laptop = newList;
    notifyListeners();
  }

  List<Product> get getLaptopList {
    return laptop;
  }

  Future<void> getMakeupData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("makeup")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        makeupData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(makeupData!);
      },
    );
    makeup = newList;
    notifyListeners();
  }

  List<Product> get getMakeuptList {
    return makeup;
  }

  Future<void> getPerfumeData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("perfume")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        perfumeData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(perfumeData!);
      },
    );
    perfume = newList;
    notifyListeners();
  }

  List<Product> get getPerfumeList {
    return perfume;
  }

  Future<void> getSmartbeltData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("samrtbelt")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        smartbeltData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(smartbeltData!);
      },
    );
    smartbelt = newList;
    notifyListeners();
  }

  List<Product> get getSmartbeltList {
    return smartbelt;
  }

  Future<void> getSmartPhoneData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("samrtbelt")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        smartphoneData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(smartphoneData!);
      },
    );
    smartphone = newList;
    notifyListeners();
  }

  List<Product> get getSmartPhoneList {
    return smartphone;
  }

  Future<void> getWatchData() async {
    List<Product> newList = [];
    var shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection("watch")
        .orderBy("Publication date")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        watchData = Product(
            description: element.data()["description"],
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);

        newList.add(watchData!);
      },
    );
    watch = newList;
    notifyListeners();
  }

  List<Product> get getWatchList {
    return watch;
  }

  late List<Product> searchList;
  void getSearchList({required List<Product> list}) {
    searchList = list;
  }

  List<Product> searchCategoryList(String query) {
    List<Product> searchShirt = searchList.where((element) {
      return element.name!.toUpperCase().contains(query) ||
          element.name!.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }
}
