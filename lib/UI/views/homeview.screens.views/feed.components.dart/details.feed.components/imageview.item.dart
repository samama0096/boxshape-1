import 'package:flutter/material.dart';

import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    Key? key,
    required this.productdata,
  }) : super(key: key);
  final Productdata productdata;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(productdata.name),
      ),
      body: PinchZoom(
        child: Image.network(productdata.imageurls![0]),
        resetDuration: const Duration(milliseconds: 100),
        maxScale: 2.5,
      ),
    ));
  }
}
