import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/model/mybutton.dart';
import 'package:lets/model/notifaction_button.dart';
import 'package:lets/screens/Costumers/pages_rout.dart';
import 'package:lets/screens/Both/splash.dart';
import 'package:lets/screens/Costumers/chekout.dart';
import 'package:lets/screens/Both/home_page.dart';
import '../../provider/product_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  String? image;
  String? name;
  int? price;
  String? des;
  DetailScreen({this.image, this.name, this.price, this.des});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;

  final TextStyle myStyle =
      TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis);
  Widget _buildImage() {
    return Center(
      child: SizedBox(
        width: 380,
        child: Card(
          child: Container(
            padding: EdgeInsets.all(13),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.89,
                child: Text(
                  widget.name!,
                  style: myStyle,
                ),
              ),
              Text(
                "\$ ${widget.price.toString()}",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text("Description", style: myStyle),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscription() {
    return SizedBox(
      height: 170,
      child: ListView(
        children: [
          Wrap(
            children: <Widget>[
              Text(
                widget.des!,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuentityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Quentity",
          style: myStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count--;
                    }
                  });
                },
              ),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              GestureDetector(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget _buildButtonPart() {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Page", style: TextStyle(color: kPrimaryColor)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Visibility(
              visible: !(productProvider!.isAdmin),
              child: NotificationButton()),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildImage(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildNameToDescriptionPart(),
                    _buildDiscription(),
                    Visibility(
                        visible: !(productProvider!.isAdmin),
                        child: _buildQuentityPart()),
                    SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: !(productProvider!.isAdmin),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: SizedBox(
                                  height: 45,
                                  child: MaterialButton(
                                      color: kPrimaryColor,
                                      onPressed: () {
                                        setState(() {
                                          print(widget.name!.toString());
                                          productProvider!.getCheckOutData(
                                            image: widget.image,
                                            name: widget.name,
                                            price: widget.price,
                                            quentity: count,
                                          );
                                        });

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Your product added to cart")));
                                      },
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
