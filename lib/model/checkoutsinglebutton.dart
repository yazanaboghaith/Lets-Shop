import 'package:flutter/material.dart';
import 'package:lets/constants/constants.dart';
import 'package:lets/provider/product_provider.dart';
import 'package:provider/provider.dart';

class CheckOutSingleProduct extends StatefulWidget {
  final String? name;
  final String? image;
  final int? index;

  final quentity;
  final int? price;
  const CheckOutSingleProduct({
    Key? key,
    this.index,
    this.quentity,
    this.image,
    this.name,
    this.price,
  }) : super(key: key);
  @override
  _CheckOutSingleProductState createState() => _CheckOutSingleProductState();
}

TextStyle myStyle = TextStyle(fontSize: 18);
ProductProvider? productProvider;

class _CheckOutSingleProductState extends State<CheckOutSingleProduct> {
  Widget _buildImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 + 50,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image!),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    int count = widget.quentity!;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildImage(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 + 50,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name!,
                          style: myStyle,
                        ),
                        // _buildNameAndClosePart(),
                        // _buildColorAndSizePart(),
                        Text(
                          "\$${widget.price!.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
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
                                      productProvider!
                                          .modifyquantiti(count, widget.index!);
                                    }
                                  });
                                },
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    count++;
                                    productProvider!
                                        .modifyquantiti(count, widget.index!);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.minimize,
                      size: 30,
                    ),
                    onPressed: () {
                      productProvider!.deleteCheckoutProduct(widget.index!);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
