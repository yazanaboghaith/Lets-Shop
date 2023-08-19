import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/services/tans.dart';
import 'package:provider/provider.dart';
import '../../provider/category_provider.dart';
import '../../provider/product_provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

//  عرفت غرض من نوع بروفايدر وخليتو عام كرمال اقدر استخدمو نفسو بأي صفحة تانية بدي اياها
//لانو انا اول ماشغل التطبيق رح جيب كل شي ميثودات  بدي اياها من البروفايدر
CategoryProvider? categoryProvider;
ProductProvider? productProvider;

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth
      .instance; //كرمال اقدر استخدم الميثودات تبعها متل تسجيل دخول وخروج واقدر جيب بيانات المستخدم الحالي authهي التعليمة اخدت منها عنصر من مكتبة ال
  User? user;
  bool isEmailVerified = false;
  Timer? timer;

  Future<void> checkVerify() async {
    user = auth.currentUser;
    isEmailVerified = await user!.emailVerified;
    if (isEmailVerified) {
      setState(() {
        isEmailVerified = true;
      });
    } else {
      isEmailVerified = false;
    }
  }

  @override
  void initState() {
    checkVerify();
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() async {
    await Future.delayed(
        Duration(seconds: 7),
        () => {
              if (isEmailVerified)
                {Navigator.popAndPushNamed(context, Pagerouter.id)}
              else
                {Navigator.popAndPushNamed(context, Transpage.id)}
            });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getCallAllFunction() async {
    categoryProvider!.getShirtData();
    categoryProvider!.getDressData();
    categoryProvider!.getShoesData();
    categoryProvider!.getPantData();
    categoryProvider!.getTieData();
    categoryProvider!.getWatchData();
    categoryProvider!.getgalssData();
    categoryProvider!.getLaptopData();
    categoryProvider!.getMakeupData();
    categoryProvider!.getHandbagData();
    categoryProvider!.getPerfumeData();
    categoryProvider!.getHeadphoneData();
    categoryProvider!.getHighheelsData();
    categoryProvider!.getSmartbeltData();
    categoryProvider!.getSmartPhoneData();
    productProvider!.getUserData();
    productProvider!.getadmindata();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecandryColor],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft),
            ),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image(
                    width: 150,
                    image: AssetImage("Image/Logo.png"),
                  ),
                  Text("Let's Shop",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "Your market is now on your hand",
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          speed: const Duration(milliseconds: 144),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
