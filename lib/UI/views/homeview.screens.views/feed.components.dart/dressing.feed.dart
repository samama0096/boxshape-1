import 'package:boxshape/Helpers/models/product.model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'details.items.feed.dart';

class DressingFeed extends StatefulWidget {
  DressingFeed({Key? key}) : super(key: key);

  @override
  _DressingFeedState createState() => _DressingFeedState();
}

class _DressingFeedState extends State<DressingFeed> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      height: s.height,
      width: s.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('availableProducts')
                .snapshots(),
            builder: (context, snapshot) {
              List<Productdata> prodlist = <Productdata>[];
              if (snapshot.hasData) {
                snapshot.data!.docs
                  ..forEach((DocumentSnapshot doc) {
                    Productdata pd = Productdata.fromDocument(doc);
                    if (pd.tags == 0) {
                      prodlist.add(pd);
                    } else {}
                  });
                return GridView.builder(
                    itemCount: prodlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedItemsDetails(
                                        productdata: prodlist[index])));
                          },
                          child: Card(
                            elevation: 10,
                            color: Colors.yellow[100],
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipOval(
                                    child: Container(
                                      height: 130,
                                      width: 120,
                                      child: Image.network(
                                        prodlist[index].imageurls![0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      prodlist[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      prodlist[index].price.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    ));
  }
}
