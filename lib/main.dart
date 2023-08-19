import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets/provider/category_provider.dart';
import 'package:lets/screens/Admins/Add_Products.dart';
import 'package:lets/screens/Admins/Edit_Details.dart';
import 'package:lets/screens/Admins/Edit_Products.dart';
import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Both/forgetpass_page.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Both/login_page.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Costumers/profile_page.dart';
import 'package:lets/screens/Both/signup_page.dart';
import 'package:lets/screens/Costumers/verifyemail_page.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:lets/services/tans.dart';
import 'package:provider/provider.dart';
import 'provider/product_provider.dart';
import 'screens/Admins/adminpage_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            SignUpPage.id: (ctx) => SignUpPage(),
            LoginPage.id: (ctx) => LoginPage(),
            HomePage.id: (ctx) => HomePage(),
            Transpage.id: (ctx) => Transpage(),
            ForgetPassword.id: (ctx) => ForgetPassword(),
            VerifyEmailPage.id: (ctx) => VerifyEmailPage(),
            AdminHome.id: (ctx) => AdminHome(),
            AddProducts.id: (ctx) => AddProducts(),
            ProfilePage.id: (ctx) => ProfilePage(),
            EditProducts.id: (ctx) => EditProducts(),
            Pagerouter.id: (ctx) => Pagerouter(),
            AdminPagerouter.id: (ctx) => AdminPagerouter(),
            EditDetails.id: (ctx) => EditDetails()
          },
          home: Splash()),
    );
  }
}
