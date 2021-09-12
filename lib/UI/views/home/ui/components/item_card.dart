import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/UI/views/home/models/product.dart';
import 'package:boxshape/UI/views/home/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/src/widgets/navigator.dart';
import '../../constants.dart';

class ItemCard extends StatelessWidget {
  final Productdata product;
  //final Function press;

  const ItemCard(this.product,);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(product))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              //height: 180,
              //width: 160,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16)),
              child: Image.network(product.imageurls![0]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.name,
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text("\$${product.price}")
        ],
      ),
    );
  }
}
