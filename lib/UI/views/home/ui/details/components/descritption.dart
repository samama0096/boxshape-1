import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/UI/views/home/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Productdata product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
      child: Text("InStock: ${product.instock}", style: TextStyle(height: 1.5)),
    );
  }
}
