import 'package:flutter/material.dart';

import 'cart_counter.dart';

class CountNdFav extends StatelessWidget {
  const CountNdFav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
