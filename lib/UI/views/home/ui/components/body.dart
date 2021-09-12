import 'package:boxshape/Firebase/services/product.firebase.dart';
import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/UI/views/home/constants.dart';
import 'package:boxshape/UI/views/home/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
//import 'package:onlinestore/ui/details/details_screen.dart';
//import 'package:flutter/src/widgets/navigator.dart';
import 'categories.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Productdata> prodlist = <Productdata>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Men",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('availableProducts')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data!.docs.forEach((DocumentSnapshot doc) {
                      Productdata pd = Productdata.fromDocument(doc);
                      prodlist.add(pd);
                    });
                    return GridView.builder(
                        itemCount: prodlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75),
                        itemBuilder: (context, index) => ItemCard(
                              prodlist[index],
                            ));
                  }
                  return CircularProgressIndicator();
                }),
          ),
        ),
      ],
    );
  }
}
