import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets/constants/constants.dart';

import 'package:lets/screens/Admins/admin_home_page.dart';
import 'package:lets/screens/Admins/adminpage_router.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:provider/provider.dart';

import '../../provider/category_provider.dart';
import '../../provider/product_provider.dart';

class EditDetails extends StatefulWidget {
  static String id = "Edit_Details";
  String? image;
  String? name;
  String? categoryname;
  int? price;
  String? des;
  EditDetails(
      {Key? key,
      this.image,
      this.des,
      this.name,
      this.price,
      this.categoryname})
      : super(key: key);
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

TextEditingController nameController = TextEditingController();
TextEditingController PriceController = TextEditingController();
TextEditingController DiscriptionController = TextEditingController();

class _EditDetailsState extends State<EditDetails> {
  int count = 1;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String? conv;
  bool _isLoading = false;
  int? price;

  String? imageName = "";
  File? imagePath;
  bool selected = false;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storegRef = FirebaseStorage.instance;

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

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

  Future _uploudImage() async {
    setState(() {
      _isLoading = true;
    });

    String uploadFileName = imageName.toString() + ".jpg";
    Reference reference = storegRef
        .ref()
        .child("Category")
        .child(widget.categoryname.toString().toLowerCase())
        .child(uploadFileName);

    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        var coll = FirebaseFirestore.instance
            .collection("category")
            .doc("WjQCk5iqTvPpiLVeGRXU")
            .collection(widget.categoryname.toString().toLowerCase());
        await coll.get().then((value) => value.docs.forEach((element) {
              if (widget.name == element.data()["name"] &&
                  widget.price == element.data()["price"] &&
                  widget.image == element.data()["image"]) {
                var docs = element.id;
                coll.doc(docs).update({"image": uploadPath});
                widget.image = uploadPath;
              }
            }));
      } else {
        _showMessege("Something While Uploading Image");
      }
      setState(() {
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

  editnameproduct() async {
    var coll = FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection(widget.categoryname.toString().toLowerCase());
    await coll.get().then((value) => value.docs.forEach((element) async {
          if (widget.name == element.data()["name"] &&
              widget.price == element.data()["price"] &&
              widget.image == element.data()["image"]) {
            var docs = element.id;
            await coll.doc(docs).update({"name": nameController.text});
            widget.name = nameController.text;
          }
          setState(() {
            _isLoading = false;
          });
        }));

    _showMessege("The Name Products is updated");
  }

  deletproduct() async {
    setState(() {
      _isLoading = true;
    });
    var coll = FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection(widget.categoryname.toString().toLowerCase());
    await coll.get().then((value) => value.docs.forEach((element) {
          if (widget.name == element.data()["name"] &&
              widget.price == element.data()["price"] &&
              widget.image == element.data()["image"]) {
            var docs = element.id;
            coll.doc(docs).delete();
          }
          setState(() {
            _isLoading = false;
          });
        }));
    Navigator.popAndPushNamed(context, AdminPagerouter.id);
    _showMessege("Product is Deleted");
  }

  editpriceproduct() async {
    setState(() {
      conv = PriceController.text;
      price = int.parse(conv!);
      _isLoading = true;
    });

    var coll = FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection(widget.categoryname.toString().toLowerCase());
    await coll.get().then((value) => value.docs.forEach((element) {
          if (widget.name == element.data()["name"] &&
              widget.price == element.data()["price"] &&
              widget.image == element.data()["image"]) {
            var docs = element.id;
            coll.doc(docs).update({"price": price});
            widget.price = price;
          }
          setState(() {
            _isLoading = false;
            PriceController.clear();
          });
        }));

    _showMessege("The price Products is update");
  }

  editdesproduct() async {
    setState(() {
      _isLoading = true;
    });

    var coll = FirebaseFirestore.instance
        .collection("category")
        .doc("WjQCk5iqTvPpiLVeGRXU")
        .collection(widget.categoryname.toString().toLowerCase());
    await coll.get().then((value) => value.docs.forEach((element) {
          if (widget.name == element.data()["name"] &&
              widget.price == element.data()["price"] &&
              widget.image == element.data()["image"]) {
            var docs = element.id;
            coll.doc(docs).update({"description": DiscriptionController.text});
            widget.des = DiscriptionController.text;
          }
          setState(() {
            _isLoading = false;
          });
        }));

    _showMessege("The Description Products is update");
  }

  Future<void> getCallAllFunction() async {
    categoryProvider!.getShirtData();
    categoryProvider!.getDressData();
    categoryProvider!.getShoesData();
    categoryProvider!.getPantData();
    categoryProvider!.getTieData();

    productProvider!.getUserData();
    productProvider!.getuserinfo;
    productProvider!.getadmindata();
    productProvider!.getcheckadmin;
  }

  @override
  Widget build(BuildContext context) {
    double hieght = MediaQuery.of(context).size.height;
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);

    getCallAllFunction();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Detail Page", style: TextStyle(color: kPrimaryColor)),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              )),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: ListView(children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Name Products:",
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(127)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Text(widget.name!)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    content: Form(
                                                  key: _globalKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text("Enter a New Name"),
                                                      TextFormField(
                                                          validator: ((value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please enter New Name";
                                                            }
                                                          }),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          controller:
                                                              nameController),
                                                      SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          MaterialButton(
                                                              minWidth: 2,
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                          MaterialButton(
                                                              minWidth: 2,
                                                              onPressed:
                                                                  () async {
                                                                if (_globalKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  await editnameproduct();

                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                              child: Text(
                                                                "Save",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                              });
                                        },
                                        icon: Icon(Icons.edit))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price Products:",
                            style: TextStyle(
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(127)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(widget.price!.toString()),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                    content: Form(
                                                  key: _globalKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text("Enter a New Price"),
                                                      TextFormField(
                                                          validator: ((value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please enter a New Price";
                                                            }
                                                          }),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              PriceController),
                                                      SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          MaterialButton(
                                                              minWidth: 2,
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                          MaterialButton(
                                                              minWidth: 2,
                                                              onPressed: () {
                                                                if (_globalKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  editpriceproduct();
                                                                  Navigator.pop(
                                                                      context);
                                                                }
                                                              },
                                                              child: Text(
                                                                "Save",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ));
                                              });
                                        },
                                        icon: Icon(Icons.edit))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Description Products:",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(127)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Text(
                                              widget.des!,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                        content: Form(
                                                      key: _globalKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              "Enter a New Description"),
                                                          TextFormField(
                                                              validator:
                                                                  ((value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return "Please enter New Description";
                                                                }
                                                              }),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .name,
                                                              controller:
                                                                  DiscriptionController),
                                                          SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              MaterialButton(
                                                                  minWidth: 2,
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                    "Cancel",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  )),
                                                              MaterialButton(
                                                                  minWidth: 2,
                                                                  onPressed:
                                                                      () async {
                                                                    if (_globalKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      await editdesproduct();

                                                                      Navigator.pop(
                                                                          context);
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    "Save",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                  )),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ));
                                                  });
                                            },
                                            icon: Icon(Icons.edit))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hieght * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor)),
                                  onPressed: () {
                                    imagePicker();
                                  },
                                  child: Text("Select Picture")),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor)),
                                  onPressed: () {
                                    setState(() {
                                      _uploudImage();
                                    });
                                  },
                                  child: Text("Save Picture")),
                            ]),
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kPrimaryColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: selected
                                      ? Image(
                                          image: FileImage(imagePath!),
                                        )
                                      : Image(
                                          image: NetworkImage(widget.image!))),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              "Are you sure to delete this product?",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              MaterialButton(
                                                  minWidth: 2,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  )),
                                              MaterialButton(
                                                  color: Colors.red,
                                                  minWidth: 2,
                                                  onPressed: () async {
                                                    await deletproduct();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ));
                                    });
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Delete Product"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.delete)
                                  ]),
                            ))
                      ],
                    ),
                  ]),
                ])));
  }
}
