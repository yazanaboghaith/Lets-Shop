import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';

import 'package:lets/screens/Both/login_page.dart';

import 'package:lets/services/auth.dart';
import 'package:lets/model/textinput.dart';

class ForgetPassword extends StatefulWidget {
  static String id = 'ForgetPass';

  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Auth? auth = Auth();

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
                              "Reset Password",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold,
                              ),
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _globalKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: hieght * .09,
                        ),
                        Center(
                            child: Text(
                          "Receive an email to reset your password",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(
                          height: hieght * .04,
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
                          height: hieght * .05,
                        ),
                        InkWell(
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              if (auth!.emailController != "" &&
                                  auth!.passwordController != "") {
                                auth!.resetPass(context);
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
                            child: Center(
                                child: Text("Reset Password",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ),
                        ),
                        SizedBox(
                          height: hieght * .05,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, LoginPage.id);
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
  }
}
