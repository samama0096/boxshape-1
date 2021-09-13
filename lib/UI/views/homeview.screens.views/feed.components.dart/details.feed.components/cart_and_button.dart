import 'package:boxshape/Firebase/services/cart.firebase.dart';
import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CartNdButton extends StatefulWidget {
  CartNdButton({
    Key? key,
    required this.product, required this.curid,
  }) : super(key: key);
  final Productdata product;
  final String curid;

  @override
  State<CartNdButton> createState() => _CartNdButtonState();
}

class _CartNdButtonState extends State<CartNdButton> {
  Userdata? savedUserData;
  // CartUserData? addtocart;
  String? username;
  getCurUserData() async {
    savedUserData = await LoginUserDataPrefs.getSavedLoginData();

    setState(() {
      username = savedUserData!.username;
    });
    print(savedUserData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurUserData();
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
                  Navigator.pop(context);
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
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
                onPressed: () async {
                  await CartUserData.addtousercart(
                      widget.curid, username);
                },
                child: Text("BUY NOW".toUpperCase(),
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
