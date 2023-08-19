import 'package:flutter/material.dart';

import 'package:lets/constants/constants.dart';

import 'package:lets/screens/Both/login_page.dart';
import 'package:lets/services/auth.dart';
import 'package:lets/model/textinput.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);
  static String id = 'SignUpPage';
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool hidePass = true;
  final GlobalKey<ScaffoldMessengerState> _scaffoldkey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Auth? auth = Auth();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldkey,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
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
                              "SignUp",
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
            // SizedBox(
            //   height: hieght * 0.04,
            // ),
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
                            type: TextInputType.name,
                            control: auth!.fullnameController,
                            hint: "Full Name",
                            icon: Icons.person,
                            autocorrect: true,
                            enableSuggestions: false,
                            obscureText: false),
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
                          height: hieght * .02,
                        ),
                        TextInput(
                            type: TextInputType.phone,
                            control: auth!.phoneController,
                            hint: "Phone",
                            icon: Icons.phone,
                            autocorrect: true,
                            enableSuggestions: false,
                            obscureText: false),
                        SizedBox(
                          height: hieght * .02,
                        ),
                        TextInput(
                            type: TextInputType.visiblePassword,
                            control: auth!.passwordController,
                            hint: "Password",
                            icon: Icons.vpn_key,
                            iconbut: IconButton(
                                color: kPrimaryColor,
                                onPressed: () {
                                  setState(() {
                                    hidePass = !hidePass;
                                  });
                                },
                                icon: Icon(Icons.remove_red_eye)),
                            autocorrect: false,
                            enableSuggestions: true,
                            obscureText: hidePass),
                        SizedBox(
                          height: hieght * .02,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              if (auth!.emailController != "" &&
                                  auth!.passwordController != "" &&
                                  auth!.fullnameController != "" &&
                                  auth!.phoneController != "") {
                                setState(() {
                                  loading = true;
                                });

                                await auth!.signUp(context);
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
                                    child: Text("SignUp",
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
                                      builder: (context) => LoginPage()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                "Login",
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
