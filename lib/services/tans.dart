import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets/screens/Both/login_page.dart';
import 'package:lets/screens/Costumers/verifyemail_page.dart';

class Transpage extends StatefulWidget {
  Transpage({Key? key}) : super(key: key);
  static String id = "TransPage";

  @override
  State<Transpage> createState() => _TransState();
}

class _TransState extends State<Transpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong!"),
            );
          } else if (snapshot.hasData) {
            return VerifyEmailPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
