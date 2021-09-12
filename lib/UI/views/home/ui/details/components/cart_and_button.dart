
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CartNdButton extends StatelessWidget {
  const CartNdButton({
    Key? key,
  }) : super(key: key);

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
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black)),
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                  "lib/assets/icons/addd_to_cart.svg",
                  color: Colors.black)),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                  //backgroundColor: Colors.black,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
                onPressed: () {},
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
