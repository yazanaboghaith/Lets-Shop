import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lets/classes/user_class.dart';
import 'package:lets/screens/Both/forgetpass_page.dart';

import 'package:lets/screens/Both/home_page.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';

import '../../provider/product_provider.dart';
import '../../services/auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  static String id = "ProfilePgae";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Auth? auth = Auth();
  String? name;
  String? number;
  String? address;
  bool _isLoading = false;
  bool isSelected = false;
  String? imageName = "";
  File? imagePath;
  @override
  void initState() {
    productProvider!.getUserData();

    super.initState();
  }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  FirebaseAuth uid = FirebaseAuth.instance;
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage storegRef = FirebaseStorage.instance;
  String collectionName = "Image";

  UserModel? userModel;
  Future<void> getuserinfo() async {
    await productProvider!.getUserData();
    userModel = await productProvider!.userModel;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    UserModel? userModel = productProvider!.userModel;
    getuserinfo();
    double hieght = MediaQuery.of(context).size.height;
    return _isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Text(""),
              backgroundColor: kPrimaryColor,
              centerTitle: true,
              title: Text("Profile"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      Center(
                          child: Column(children: [
                        _isLoading
                            ? CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                child: CircularProgressIndicator(),
                              )
                            : isSelected
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(imagePath!),
                                  )
                                : _isLoading
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.white,
                                        child: CircularProgressIndicator(),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                            userModel!.userImage.toString()),
                                      ),
                        // Image.file(imagePath!),
                        SizedBox(
                          height: hieght * .02,
                        ),
                        InkWell(
                          onTap: () {
                            imagePicker();
                          },
                          child: Container(
                            width: 70,
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(127)),
                              gradient: LinearGradient(
                                  colors: [kPrimaryColor, kSecandryColor],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: Center(
                                child: Text("Add Image",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ),
                        ),
                        SizedBox(
                          height: hieght * .005,
                        ),
                        InkWell(
                          onTap: () {
                            _uploudImage();
                          },
                          child: Container(
                            width: 70,
                            height: 25,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(127)),
                              gradient: LinearGradient(
                                  colors: [kPrimaryColor, kSecandryColor],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight),
                            ),
                            child: Center(
                                child: Text("Save",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          ),
                        ),
                        SizedBox(
                          height: hieght * .03,
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
                                      Icon(Icons.person),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(userModel!.userName.toString()),
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
                                                              return "Please enter new name";
                                                            }
                                                          }),
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          controller: auth!
                                                              .fullnameController),
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
                                                                  auth!.editnameuser(
                                                                      context);
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
                        SizedBox(
                          height: hieght * .03,
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
                                      Icon(Icons.phone),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          userModel.userPhoneNumber.toString()),
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
                                                          "Enter a New Phone Number"),
                                                      TextFormField(
                                                          validator: ((value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please enter new phone number";
                                                            }
                                                          }),
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          controller: auth!
                                                              .phoneController),
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
                                                                  auth!.editnumberuser(
                                                                      context);
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
                        SizedBox(
                          height: hieght * .03,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(color: kPrimaryColor, width: 1),
                        //     borderRadius: BorderRadius.all(Radius.circular(127)),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             children: [
                        //               Icon(Icons.location_on),
                        //               SizedBox(
                        //                 width: 10,
                        //               ),
                        //               Text(userModel.userAddress.toString()),
                        //             ],
                        //           ),
                        //         ),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: [
                        //             IconButton(
                        //                 onPressed: () {
                        //                   showDialog(
                        //                       context: context,
                        //                       builder: (context) {
                        //                         return AlertDialog(
                        //                             content: Column(
                        //                           mainAxisSize: MainAxisSize.min,
                        //                           children: [
                        //                             TextFormField(
                        //                                 keyboardType: TextInputType
                        //                                     .streetAddress,
                        //                                 controller:
                        //                                     auth!.addressController),
                        //                             SizedBox(
                        //                               height: 20,
                        //                               width: 20,
                        //                             ),
                        //                             Row(
                        //                               mainAxisAlignment:
                        //                                   MainAxisAlignment.end,
                        //                               children: [
                        //                                 MaterialButton(
                        //                                     minWidth: 2,
                        //                                     onPressed: () {
                        //                                       Navigator.pop(context);
                        //                                     },
                        //                                     child: Text(
                        //                                       "Cancel",
                        //                                       style: TextStyle(
                        //                                           fontSize: 10),
                        //                                     )),
                        //                                 MaterialButton(
                        //                                     minWidth: 2,
                        //                                     onPressed: () {
                        //                                       auth!.editaddressuser(
                        //                                           context);
                        //                                       Navigator.pop(context);
                        //                                     },
                        //                                     child: Text(
                        //                                       "Save",
                        //                                       style: TextStyle(
                        //                                           fontSize: 10),
                        //                                     )),
                        //                               ],
                        //                             )
                        //                           ],
                        //                         ));
                        //                       });
                        //                 },
                        //                 icon: Icon(Icons.edit))
                        //           ],
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: hieght * .045,
                        ),
                        InkWell(
                          onTap: () {
                            auth!.logOut(context);
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
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Logout",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            )),
                          ),
                        ),
                      ])),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  _uploudImage() async {
    setState(() {
      _isLoading = true;
    });

    var uniqueKey = firestoreRef
        .collection("Users")
        .doc("HdvW68QCQ43R51swAQVH")
        .collection("Customers")
        .doc(uid.currentUser!.uid);
    String uploadFileName = uid.currentUser!.uid.toString() + ".jpg";
    Reference reference = storegRef.ref().child("Users").child(uploadFileName);

    UploadTask uploadTask = reference.putFile(File(imagePath!.path));
    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });
    await uploadTask.whenComplete(() async {
      var uploadPath = await uploadTask.snapshot.ref.getDownloadURL();
      if (uploadPath.isNotEmpty) {
        firestoreRef
            .collection("Users")
            .doc("HdvW68QCQ43R51swAQVH")
            .collection("Customers")
            .doc(uid.currentUser!.uid)
            .update({"UserImage": uploadPath}).then(
                (value) => _showMessege("Image Inserted."));
      } else {
        _showMessege("Something While Uploading Image");
      }
    });
    setState(() {
      isSelected = false;
      _isLoading = false;
      imageName = "";
      imagePath = null;
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
        isSelected = true;
      });
    }
  }
}
