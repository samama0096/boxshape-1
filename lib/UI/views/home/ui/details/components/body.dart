import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/UI/views/home/constants.dart';
import 'package:boxshape/UI/views/home/models/product.dart';
import 'package:boxshape/UI/views/home/ui/details/components/cart_and_button.dart';
import 'package:boxshape/UI/views/home/ui/details/components/descritption.dart';
import 'package:boxshape/UI/views/home/ui/details/components/product_title_with_image.dart';
//import 'package:boxshape/UI/views/homeview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'cart_counter.dart';
import 'count_with_fav.dart';
import 'size.dart';

class BodyDet extends StatelessWidget {
  final Productdata product;
  const BodyDet({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        product.imageurls![0],
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            padding: EdgeInsets.only(
                top: size.height * 0.12,
                left: kDefaultPaddin,
                right: kDefaultPaddin),
            //height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorAndSize(),
                Description(product: product),
                CountNdFav(),
                CartNdButton(),
              ],
            ),
          ),
          ProductTitleWithImage(product: product),
        ],
      ),
    );
  }
}
