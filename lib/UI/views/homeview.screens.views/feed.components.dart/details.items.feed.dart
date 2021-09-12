import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/details.feed.components/cart_and_button.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/details.feed.components/count_with_fav.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/details.feed.components/descritption.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.components.dart/details.feed.components/size.dart';
import 'package:flutter/material.dart';

import 'package:boxshape/Helpers/models/product.model.dart';

class FeedItemsDetails extends StatefulWidget {
  FeedItemsDetails({
    Key? key,
    required this.productdata,
  }) : super(key: key);
  final Productdata productdata;
  @override
  _FeedItemsDetailsState createState() => _FeedItemsDetailsState();
}

class _FeedItemsDetailsState extends State<FeedItemsDetails> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: s.height,
          width: s.width,
          child: Stack(
            children: [
              Container(
                height: s.height * 0.55,
                width: s.width,
                child: Image.network(
                  widget.productdata.imageurls![0],
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: s.height * 0.6,
                  width: s.width,
                  margin: EdgeInsets.only(top: s.height * 0.3),
                  padding: EdgeInsets.only(
                      top: s.height * 0.12, left: 10, right: 10),
                  //height: 500,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ColorAndSize(),
                      Description(product: widget.productdata),
                      CountNdFav(),
                      CartNdButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
