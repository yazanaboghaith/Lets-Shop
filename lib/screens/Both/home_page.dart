import 'package:flutter/material.dart';
import 'package:lets/model/cart_product.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/classes/product_class.dart';
import 'package:lets/model/categoryIcon.dart';
import 'package:lets/model/notifaction_button.dart';
import 'package:lets/provider/category_provider.dart';
import 'package:lets/provider/product_provider.dart';
import 'package:lets/screens/Costumers/about.dart';
import 'package:lets/screens/Costumers/category_page.dart';
import 'package:lets/screens/Costumers/product_page.dart';
import 'package:lets/services/auth.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = true;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Auth auth = Auth();

  Widget _buildDressIcon() {
    List<Product> dress = categoryProvider!.getDressList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "Dress",
              snapShot: dress,
            ),
          ),
        );
      },
      child: categoryicon(image: "Image/dress.png", name: "Dress"),
    );
  }

  Widget _buildShirtIcon() {
    List<Product> shirts = categoryProvider!.getShirtList;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "Shirt",
              snapShot: shirts,
            ),
          ),
        );
      },
      child: categoryicon(image: "Image/tshirt.png", name: "Shirts"),
    );
  }

  Widget _buildShoeIcon() {
    List<Product> shoes = categoryProvider!.getshoesList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "Shoes",
              snapShot: shoes,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/shoes.png",
        name: "Shoes",
      ),
    );
  }

  Widget _buildPantIcon() {
    List<Product> pant = categoryProvider!.getPantList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "Pant",
              snapShot: pant,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/jeans.png",
        name: "Pants",
      ),
    );
  }

  Widget _buildTieIcon() {
    List<Product> tie = categoryProvider!.getTieList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "Tie",
              snapShot: tie,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/tie.png",
        name: "Ties",
      ),
    );
  }

  Widget _buildGlassIcon() {
    List<Product> glass = categoryProvider!.getGlassList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "glass",
              snapShot: glass,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/glasses.png",
        name: "Glesses",
      ),
    );
  }

  Widget _buildHandBagIcon() {
    List<Product> handbag = categoryProvider!.getHandbagList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "handbag",
              snapShot: handbag,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/handbag.png",
        name: "Hand Bages",
      ),
    );
  }

  Widget _buildHeadphoneIcon() {
    List<Product> headphone = categoryProvider!.getHeadphoneList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "headphone",
              snapShot: headphone,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/headphones.png",
        name: "Headphone",
      ),
    );
  }

  Widget _buildHighheelsIcon() {
    List<Product> highheels = categoryProvider!.getHighheelsList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "highheels",
              snapShot: highheels,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/high-heels.png",
        name: "High Heels",
      ),
    );
  }

  Widget _buildLaptopIcon() {
    List<Product> laptop = categoryProvider!.getLaptopList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "laptop",
              snapShot: laptop,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/laptop-screen.png",
        name: "Laptop",
      ),
    );
  }

  Widget _buildMakeupIcon() {
    List<Product> makeup = categoryProvider!.getMakeuptList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "makeup",
              snapShot: makeup,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/makeup.png",
        name: "Makeup",
      ),
    );
  }

  Widget _buildPerfumeIcon() {
    List<Product> perfume = categoryProvider!.getPerfumeList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "perfume",
              snapShot: perfume,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/perfume.png",
        name: "Perfume",
      ),
    );
  }

  Widget _buildSamrtbeltIcon() {
    List<Product> smartbelt = categoryProvider!.getSmartbeltList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "smartbelt",
              snapShot: smartbelt,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/smart-belt.png",
        name: "Smart Belt",
      ),
    );
  }

  Widget _buildSmartphoneIcon() {
    List<Product> smartphone = categoryProvider!.getSmartPhoneList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "smartphone",
              snapShot: smartphone,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/smartphone.png",
        name: "Smart Phone",
      ),
    );
  }

  Widget _buildWatchIcon() {
    List<Product> watch = categoryProvider!.getWatchList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => List_Product(
              name: "watch",
              snapShot: watch,
            ),
          ),
        );
      },
      child: categoryicon(
        image: "Image/wristwatch.png",
        name: "Watch",
      ),
    );
  }

  Widget buildCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildDressIcon(),
        _buildShirtIcon(),
        _buildShoeIcon(),
        _buildPantIcon(),
        _buildTieIcon(),
        _buildGlassIcon(),
        _buildHandBagIcon(),
        _buildHeadphoneIcon(),
        _buildHighheelsIcon(),
        _buildLaptopIcon(),
        _buildMakeupIcon(),
        _buildPerfumeIcon(),
        _buildSamrtbeltIcon(),
        _buildSmartphoneIcon(),
        _buildWatchIcon()
      ],
    );
  }

  Widget _buildFeature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: productProvider!.getFeatureList.map((e) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                      des: e.description,
                    ),
                  ),
                );
              },
              child: CartProduct(
                image: e.image,
                price: e.price,
                name: e.name,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Future<void> getCallAllFunction() async {
    await categoryProvider!.getShirtData();
    await categoryProvider!.getDressData();
    await categoryProvider!.getShoesData();
    await categoryProvider!.getPantData();
    await categoryProvider!.getTieData();
    await categoryProvider!.getgalssData();
    await productProvider!.getOrderUserWaitingData();
    await productProvider!.getOrderUserApproveData();
    await productProvider!.getOrderUserDeniedData();
    await productProvider!.getUserData();
    await productProvider!.getuserinfo;
    await productProvider!.getadmindata();
    await productProvider!.getcheckadmin;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            color: kPrimaryColor,
          ))
        : Scaffold(
            backgroundColor: Colors.white,
            key: _key,
            appBar: AppBar(
              title: Text(
                "HomePage",
                style: TextStyle(color: kPrimaryColor),
              ),
              centerTitle: true,
              elevation: 5,
              backgroundColor: Colors.white,
              leading: productProvider!.isAdmin
                  ? PopupMenuButton<int>(
                      onSelected: (value) => onSelectedadmin(context, value),
                      icon: Icon(
                        Icons.more_vert,
                        color: kPrimaryColor,
                      ),
                      itemBuilder: ((context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text("Logout"),
                            ),
                          ]),
                    )
                  : PopupMenuButton<int>(
                      onSelected: (value) => onSelected(context, value),
                      icon: Icon(
                        Icons.more_vert,
                        color: kPrimaryColor,
                      ),
                      itemBuilder: ((context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text("About"),
                            ),
                          ]),
                    ),
              actions: <Widget>[
                productProvider!.isAdmin ? Text("") : NotificationButton(),
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 6, top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Categories",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SingleChildScrollView(
                              child: Column(children: [
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: buildCategory()),
                          ])),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dress",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Dress",
                                          snapShot:
                                              categoryProvider!.getDressList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getDressList
                                              .getRange(0, 9)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("T-Shirts",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "T-Shirts",
                                          snapShot:
                                              categoryProvider!.getShirtList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getShirtList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pant",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Pant",
                                          snapShot:
                                              categoryProvider!.getPantList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getPantList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tie",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Tie",
                                          snapShot:
                                              categoryProvider!.getTieList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!.getTieList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shoes",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Shoes",
                                          snapShot:
                                              categoryProvider!.getshoesList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getshoesList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Glasses",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Glasses",
                                          snapShot:
                                              categoryProvider!.getGlassList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getGlassList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Hand Bages",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Hand Bages",
                                          snapShot:
                                              categoryProvider!.getHandbagList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getHandbagList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Headphone",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Headphone",
                                          snapShot: categoryProvider!
                                              .getHeadphoneList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getHeadphoneList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("High Heels",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "High Heels",
                                          snapShot: categoryProvider!
                                              .getHighheelsList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getHighheelsList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Laptop",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Laptop",
                                          snapShot:
                                              categoryProvider!.getLaptopList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getLaptopList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Makeup",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Makeup",
                                          snapShot:
                                              categoryProvider!.getMakeuptList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getMakeuptList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Perfume",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Perfume",
                                          snapShot:
                                              categoryProvider!.getPerfumeList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getPerfumeList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Smart Belt",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Smart Belt",
                                          snapShot: categoryProvider!
                                              .getSmartbeltList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getSmartbeltList
                                              .getRange(0, 4)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Smartphones",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Smartphones",
                                          snapShot: categoryProvider!
                                              .getSmartPhoneList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children: categoryProvider!
                                              .getSmartPhoneList
                                              .getRange(0, 3)
                                              .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Watches",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => List_Product(
                                          name: "Watches",
                                          snapShot:
                                              categoryProvider!.getWatchList,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("See all",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 17,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Row(
                                          children:
                                              categoryProvider!.getWatchList
                                                  // .getRange(0)
                                                  .map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailScreen(
                                                          image: e.image,
                                                          name: e.name,
                                                          price: e.price,
                                                          des: e.description,
                                                        )));
                                          },
                                          child: CartProduct(
                                            image: e.image,
                                            name: e.name,
                                            price: e.price,
                                          ),
                                        );
                                      }).toList()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )));
  }

  onSelected(BuildContext context, int value) {
    switch (value) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => About()));
        break;
    }
  }

  onSelectedadmin(BuildContext context, int value) {
    switch (value) {
      case 0:
        auth.logOut(context);
        break;
    }
  }
}
