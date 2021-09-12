import 'package:flutter/material.dart';

import '../../../constants.dart';
//import 'body.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Size",
            style: TextStyle(color: Colors.black),
          ),
          Row(
            children: [
              SizeDot("S", false),
              SizeDot("M", true),
              SizeDot("L", false),
            ],
          )
        ]),
      )
    ]);
  }
}

class SizeDot extends StatelessWidget {
  final String size;
  final bool isSelected;
  const SizeDot(
    this.size,
    this.isSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          //color: Colors.black,
          shape: BoxShape.rectangle,
          border: Border.all(
              color: isSelected ? Colors.green.shade900 : Colors.transparent)),
      child: Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.rectangle),
          child: Text("$size",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
    );
  }
}
