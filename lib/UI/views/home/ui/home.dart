import 'package:boxshape/UI/views/home/constants.dart';
import 'package:boxshape/UI/views/home/ui/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {},
      //     icon: SvgPicture.asset(
      //       'assets/icons/back.svg',
      //       color: kTextColor,
      //     )),
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
