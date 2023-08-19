import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Both/forgetpass_page.dart';
import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Both/signup_page.dart';
import 'package:lets/services/auth.dart';
import 'package:lets/model/textinput.dart';

import '../Costumers/pages_rout.dart';
import '../Costumers/verifyemail_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool loading = false;
  Auth? auth = Auth();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("Image/Logo.png"),
                            width: 140,
                          )
                        ],
                      ),
                      SizedBox(
                        height: hieght * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, right: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
            SizedBox(
              height: hieght * 0.04,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                child: Form(
                  key: _globalKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: hieght * .02,
                        ),
                        TextInput(
                            type: TextInputType.emailAddress,
                            control: auth!.emailController,
                            hint: "Email",
                            icon: Icons.mail,
                            autocorrect: true,
                            enableSuggestions: false,
                            obscureText: false),
                        SizedBox(
                          height: hieght * .04,
                        ),
                        TextInput(
                            type: TextInputType.visiblePassword,
                            control: auth!.passwordController,
                            hint: "Password",
                            iconbut: IconButton(
                                color: kPrimaryColor,
                                onPressed: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye)),
                            icon: Icons.vpn_key,
                            autocorrect: false,
                            enableSuggestions: true,
                            obscureText: hidePass),
                        SizedBox(
                          height: hieght * .045,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Text(
                              "Forget Password?",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: kPrimaryColor,
                                  decoration: TextDecoration.underline),
                            )),
                        SizedBox(
                          height: hieght * .15,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              if (auth!.emailController != "" &&
                                  auth!.passwordController != "") {
                                setState(() {
                                  loading = true;
                                });

                                await auth!.logIn(context);
                                setState(() {
                                  loading = false;
                                });
                              }
                            }
                            ;
                          },
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
                            child: loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Center(
                                    child: Text("Login",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Don't have an account?",
                                style: TextStyle(color: kSecandryColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
