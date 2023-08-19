import 'package:flutter/material.dart';

class AdminModel {
  String? adminName, adminEmail, adminImage;
  AdminModel({
    @required this.adminEmail,
    @required this.adminImage,
    @required this.adminName,
  });
}
