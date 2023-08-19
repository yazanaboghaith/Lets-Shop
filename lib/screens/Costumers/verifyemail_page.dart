import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Both/login_page.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';

class VerifyEmailPage extends StatefulWidget {
  VerifyEmailPage({Key? key}) : super(key: key);
  static String id = 'ForgetPass';

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    user = auth.currentUser;
    isEmailVerified = user!.emailVerified;
    if (!isEmailVerified) {
      user!.sendEmailVerification();
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? Pagerouter()
      : Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Column(children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(127)),
                      gradient: LinearGradient(
                          colors: [kPrimaryColor, kSecandryColor],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("Image/Logo.png"),
                              width: 140,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, right: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Verify Email",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "A verification email has been sent to your email.",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .10,
                          ),
                          InkWell(
                            onTap: initState,
                            child: Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(127)),
                                gradient: LinearGradient(
                                    colors: [kPrimaryColor, kSecandryColor],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                              ),
                              child: Center(
                                  child: Text("Resend Email",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white))),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .05,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                    context, LoginPage.id);
                              },
                              child: Text(
                                "Back To Login",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));

  Future checkEmailVerified() async {
    user = auth.currentUser!;
    await user!.reload();
    setState(() {
      isEmailVerified = auth.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      setState(() {
        isEmailVerified = true;
      });
      timer?.cancel();
    }
  }
}
