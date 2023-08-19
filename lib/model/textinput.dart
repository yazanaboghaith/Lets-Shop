import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';

class TextInput extends StatelessWidget {
  TextInput(
      {this.type,
      this.iconbut,
      this.control,
      this.hint,
      this.icon,
      this.autocorrect,
      this.enableSuggestions,
      this.obscureText});
  String? hint;
  IconButton? iconbut;
  TextEditingController? control;
  IconData? icon;
  bool? obscureText;
  bool? enableSuggestions;
  bool? autocorrect;
  TextInputType? type;

  String? errormessage(String str) {
    switch (hint) {
      case "Email":
        return "Please Enter Your Email";
      case "Password":
        return "Please Enter Your Password";
      case "Full Name":
        return "Please Enter Your Full Name";
      case "Phone":
        return "Please Enter Your Phone Number";
      case "Name Products":
        return "requird field";
      case "Pric":
        return "requird field";
      case "Discription":
        return "requird field";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: TextFormField(
        controller: control,
        validator: ((value) {
          if (value!.isEmpty) {
            return errormessage(hint!);
          }
        }),
        obscureText: obscureText!,
        enableSuggestions: enableSuggestions!,
        autocorrect: autocorrect!,
        cursorColor: kPrimaryColor,
        style: TextStyle(
          fontSize: 15,
          color: kPrimaryColor,
        ),
        keyboardType: type,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide(
                color: kPrimaryColor,
              )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(28))),
          focusColor: kPrimaryColor,
          suffixIcon: iconbut,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            size: 20,
            color: kPrimaryColor,
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
