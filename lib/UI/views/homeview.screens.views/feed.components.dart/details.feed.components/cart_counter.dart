import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (numOfItems > 1) {
                numOfItems--;
              } else {
                //Nothing
              }
            });
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                "-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
        Text(
          "$numOfItems",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17.0,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              numOfItems++;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black.withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
