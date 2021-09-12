import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/UI/views/home/models/product.dart';
import 'package:boxshape/UI/views/home/ui/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class DetailScreen extends StatelessWidget {
  final Productdata product;
  const DetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // alignment: Alignment.center,
      // decoration: BoxDecoration(
      //     image: DecorationImage(image: AssetImage(product.imageurls![0],),fit: BoxFit.cover)),
    
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context),
          body: BodyDet(product: product));
  
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            'lib/assets/icons/back.svg',
            color: kTextColor,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/assets/icons/search.svg',
              color: kTextColor,
            )),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/assets/icons/cart.svg',
              color: kTextColor,
            )),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
