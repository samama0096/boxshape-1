import 'package:boxshape/Firebase/services/cart.firebase.dart';
import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:boxshape/UI/views/homeview.screens.views/cart.homeview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CartNdButton extends StatefulWidget {
  CartNdButton({
    Key? key,
    required this.product,
    required this.curid,
    required this.username,
  }) : super(key: key);
  final Productdata product;
  final String curid;
  final username;

  @override
  State<CartNdButton> createState() => _CartNdButtonState();
}

class _CartNdButtonState extends State<CartNdButton> {
  bool isPressed = false;
  bool alreadyAdded = false;
  Userdata? savedUserData;
  // CartUserData? addtocart;

  Future checkItemInCart() async {
    await FirebaseFirestore.instance
        .collection('cart')
        .doc(widget.username)
        .get()
        .then((value) {
      List<String> productsList = (List.from(value.data()!['cartproduct']));
      setState(() {
        isPressed = productsList.contains(widget.curid);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkItemInCart();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: kDefaultPaddin),
          height: 50,
          width: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Cartview()),
                      (route) => false);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black87,
                )),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                  //backgroundColor: Colors.black,
                  backgroundColor: isPressed
                      ? MaterialStateProperty.all(Colors.white)
                      : MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
                onPressed: () async {
                  if (!isPressed) {
                    await CartUserData.appendToArray(
                        widget.username!, widget.curid);
                    setState(() {
                      isPressed = true;
                    });
                  } else if (isPressed) {
                    await CartUserData.removeFromArray(
                        widget.username!, widget.curid);
                    setState(() {
                      isPressed = false;
                    });
                  }
                },
                child: isPressed
                    ? Text("Remove from cart".toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ))
                    : Text("Add to cart".toUpperCase(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
          ),
        )
      ]),
    );
  }
}
