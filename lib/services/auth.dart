import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:lets/classes/user_class.dart';
import 'package:lets/model/checkoutsinglebutton.dart';

import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Costumers/verifyemail_page.dart';

import '../screens/Admins/adminpage_router.dart';
import '../screens/Both/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  bool? isAdmin;
  UserCredential? result;

  var admin = FirebaseFirestore.instance
      .collection("Users")
      .doc("HdvW68QCQ43R51swAQVH")
      .collection("Admins");
  final store = FirebaseFirestore.instance
      .collection("Users")
      .doc("HdvW68QCQ43R51swAQVH")
      .collection("Customers");
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String? name;
  String? number;
  String? address;

  void logOut(context) {
    try {
      auth.signOut();
      Navigator.popAndPushNamed(context, LoginPage.id);
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  void verifyEmail(context) async {
    User? user = auth.currentUser;
    if (!(user!.emailVerified)) {
      user.sendEmailVerification();
    }
  }

  signUp(context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        print("User Signed up");

        Navigator.popAndPushNamed(context, VerifyEmailPage.id);
        saveuser();
      });
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
  }

  void saveuser() async {
    store.doc(auth.currentUser!.uid).set({
      "UserName": fullnameController.text,
      "UserId": auth.currentUser!.uid,
      "UserEmail": emailController.text,
      "UserNumber": phoneController.text,
    });
  }

  Future<void> editnameuser(context) async {
    store.doc(auth.currentUser!.uid).update({
      "UserName": fullnameController.text,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Your Name Is Updated")));
  }

  Future<void> editnumberuser(context) async {
    store.doc(auth.currentUser!.uid).update({
      "UserNumber": phoneController.text,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Your Phone Number Is Updated")));
  }

  Future<void> editaddressuser(context) async {
    store
        .doc(auth.currentUser!.uid)
        .update({"UserAddress": addressController.text});

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Your Address Is Updated")));
  }

  void checkAdmin() async {
    await admin.get().then((value) => value.docs.forEach((element) {
          if (auth.currentUser!.uid.toString() == element.data()["AdminId"]) {
            isAdmin = true;
          } else {
            isAdmin = false;
          }
          ;
        }));
  }

  UserModel? userModel;
  Future getdata() async {
    var usermodel = FirebaseFirestore.instance
        .collection("Users")
        .doc("HdvW68QCQ43R51swAQVH")
        .collection("Customers");
    await usermodel.get().then((value) => value.docs.forEach((element) {
          if (FirebaseAuth.instance.currentUser!.uid ==
              element.data()["UserId"]) {
            userModel = UserModel(
                userAddress: element.data()["UserAddress"],
                userImage: element.data()["UserImage"],
                userEmail: element.data()["UserEmail"],
                userGender: element.data()["UserGender"],
                userName: element.data()["UserName"],
                userPhoneNumber: element.data()["UserNumber"]);
          }
        }));
  }

  logIn(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        print(emailController.text.toString());
        print("User Signed in");
        getdata();

        if (auth.currentUser!.emailVerified) {
          // if (productProvider!.isAdmin) {

          // }
          Navigator.popAndPushNamed(context, Pagerouter.id);
        } else {
          Navigator.popAndPushNamed(context, VerifyEmailPage.id);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
  }

  void resetPass(context) async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password Reset Email Sent")));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
}
