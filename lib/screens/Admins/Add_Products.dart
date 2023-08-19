import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';
import '../../model/textinput.dart';

class AddProducts extends StatefulWidget {
  AddProducts({Key? key}) : super(key: key);
  static String id = "Add_Products";

  @override
  State<AddProducts> createState() => _AddProductsState();
}

TextEditingController nameController = TextEditingController();
TextEditingController PriceController = TextEditingController();
TextEditingController DiscriptionController = TextEditingController();

class _AddProductsState extends State<AddProducts> {
  List<String> category = [
    "dress",
    "pant",
    "shirt",
    "shoes",
    "tie",
    "glass",
    "handbag",
    "headphone",
    "highheels",
    "laptop",
    "makeup",
    "perfume",
    "samrtbelt",
    "smartphone",
    "watch"
  ];
  String selectCategory = "dress";
  bool selected = false;
  bool _isLoading = false;
  String? conv;
  int? price;
  String? imageName = "";
  File? imagePath;

  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storegRef = FirebaseStorage.instance;
  String collectionName = "Image";
  addproduct() async {
    setState(() {
      conv = PriceController.text;
      price = int.parse(conv!);
      _isLoading = true;
    });

    var uniqueKey = firestoreRef
        .collection("categoty")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection(selectCategory);
    String uploadFileName = imageName.toString() + ".jpg";
    Reference reference = storegRef
        .ref()
        .child("Category")
        .child(selectCategory)
        .child(imageName.toString());

    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        await firestoreRef
            .collection("category")
            .doc("WjQCk5iqTvPpiLVeGRXU")
            .collection(selectCategory)
            .add({
          "image": uploadPath,
          "name": nameController.text,
          "price": price,
          "description": DiscriptionController.text,
          "Publication date": DateTime.now().toString()
        }).then((value) => _showMessege("Products Inserted."));
      } else {
        _showMessege("Something While Uploading Image");
      }
      setState(() {
        nameController.text = "";
        PriceController.text = "";
        DiscriptionController.text = "";
        selected = false;
        _isLoading = false;
        imageName = "";
        imagePath = null;
      });
    });
  }

  _showMessege(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
    ));
  }

  Future imagePicker() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    final imagetemp = File(image!.path);
    if (image != null) {
      setState(() {
        this.imagePath = imagetemp;
        imageName = image.name.toString();
        selected = true;
      });
    }
  }

  @override
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Text("Add Products")),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 30, left: 30, top: 10),
                      child: Form(
                        key: _globalKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "To Add Products Please Insert All Fields",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: hieght * .04,
                              ),
                              TextInput(
                                  type: TextInputType.text,
                                  control: nameController,
                                  hint: "Name Products",
                                  autocorrect: true,
                                  enableSuggestions: false,
                                  obscureText: false),
                              SizedBox(
                                height: hieght * .02,
                              ),
                              TextInput(
                                  type: TextInputType.number,
                                  control: PriceController,
                                  hint: "Pric",
                                  autocorrect: true,
                                  enableSuggestions: false,
                                  obscureText: false),
                              SizedBox(
                                height: hieght * .02,
                              ),
                              TextInput(
                                  type: TextInputType.text,
                                  control: DiscriptionController,
                                  hint: "Discription",
                                  autocorrect: true,
                                  enableSuggestions: false,
                                  obscureText: false),
                              SizedBox(
                                height: hieght * .02,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Select Category",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 140,
                                      child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(28)),
                                                  borderSide: BorderSide(
                                                    color: kPrimaryColor,
                                                    width: 2,
                                                  )),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  28)),
                                                      borderSide: BorderSide(
                                                        color: kPrimaryColor,
                                                      )),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(28)),
                                                  borderSide: BorderSide(
                                                    color: kPrimaryColor,
                                                  )),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: kPrimaryColor,
                                                ),
                                              )),
                                          value: selectCategory,
                                          items: category
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(item),
                                                  ))
                                              .toList(),
                                          onChanged: (String? item) =>
                                              setState(() {
                                                selectCategory = item!;
                                              })),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: hieght * .04,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  kPrimaryColor)),
                                      onPressed: () {
                                        imagePicker();
                                      },
                                      child: Text("Add Picture")),
                                  SizedBox(
                                    width: 150,
                                    height: 150,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: kPrimaryColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: selected
                                            ? Image(
                                                image: FileImage(imagePath!),
                                              )
                                            : Image(
                                                image: AssetImage(
                                                    "Image/gallary.jpg"))),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: hieght * .04,
                              ),
                              InkWell(
                                onTap: () {
                                  if (_globalKey.currentState!.validate()) {
                                    addproduct();
                                  }
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
                                      child: Text("Add Product",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))),
                                ),
                              ),
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
