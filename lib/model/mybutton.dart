import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  Function? onressed;
  String? name;
  MyButton({this.name, this.onressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
