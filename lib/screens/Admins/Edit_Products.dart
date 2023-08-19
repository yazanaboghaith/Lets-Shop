import 'package:flutter/material.dart';
import 'package:lets/model/categoryadmin.dart';

import 'package:lets/screens/Admins/ProductsAdmin.dart';
import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Admins/adminpage_router.dart';
import 'package:lets/screens/Both/splash.dart';

import 'package:provider/provider.dart';

import '../../classes/product_class.dart';
import '../../constants/constants.dart';

import '../../provider/category_provider.dart';
import '../../provider/product_provider.dart';

class EditProducts extends StatefulWidget {
  const EditProducts({Key? key}) : super(key: key);
  static String id = "Edit_Products";
  @override
  State<EditProducts> createState() => _EditProductsState();
}

Product? menData;

Product? womenData;

Product? bulbData;
Product? featureData;
Product? smartPhoneData;

class _EditProductsState extends State<EditProducts> {
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;

  Widget _buildDressIcon() {
    List<Product> dress = categoryProvider!.getDressList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductsAdmin(
              name: "dress",
              snapShot: dress,
            ),
          ),
        );
      },
      child: Categoryadmin(image: "Image/dress.png", name: "Dress"),
    );
  }

  Widget _buildShirtIcon() {
    List<Product> shirts = categoryProvider!.getShirtList;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductsAdmin(
              name: "shirt",
              snapShot: shirts,
            ),
          ),
        );
      },
      child: Categoryadmin(image: "Image/tshirt.png", name: "Shirts"),
    );
  }

  Widget _buildShoeIcon() {
    List<Product> shoes = categoryProvider!.getshoesList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ProductsAdmin(
              name: "shoes",
              snapShot: shoes,
            ),
          ),
        );
      },
      child: Categoryadmin(
        image: "Image/shoes.png",
        name: "Shoes",
      ),
    );
  }

  Widget _buildPantIcon() {
    List<Product> pant = categoryProvider!.getPantList;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => ProductsAdmin(
              name: "pant",
              snapShot: pant,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "tie",
              snapShot: tie,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "glass",
              snapShot: glass,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "handbag",
              snapShot: handbag,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "headphone",
              snapShot: headphone,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "highheels",
              snapShot: highheels,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "laptop",
              snapShot: laptop,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "makeup",
              snapShot: makeup,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "perfume",
              snapShot: perfume,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "samrtbelt",
              snapShot: smartbelt,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "smartphone",
              snapShot: smartphone,
            ),
          ),
        );
      },
      child: Categoryadmin(
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
            builder: (ctx) => ProductsAdmin(
              name: "watch",
              snapShot: watch,
            ),
          ),
        );
      },
      child: Categoryadmin(
        image: "Image/wristwatch.png",
        name: "Watch",
      ),
    );
  }

  Widget buildCategory() {
    return Column(
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

  Future<void> getCallAllFunction() async {
    categoryProvider!.getShirtData();
    categoryProvider!.getDressData();
    categoryProvider!.getShoesData();
    categoryProvider!.getPantData();
    categoryProvider!.getTieData();

    productProvider!.getUserData();
    productProvider!.getuserinfo;
    productProvider!.getadmindata();
    productProvider!.getcheckadmin;
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Products", style: TextStyle(color: kPrimaryColor)),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, AdminPagerouter.id);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Choose a category to modify its products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            buildCategory(),
          ],
        ),
      ),
    );
  }
}
