import 'package:boxshape/Firebase/services/cart.firebase.dart';
import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'feed.components.dart/details.items.feed.dart';

class Cartview extends StatefulWidget {
  Cartview({Key? key}) : super(key: key);

  @override
  _CartviewState createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  Userdata? savedUserData;
  String? username;
  List<String> cartproductid = [];
  getCurUserData() async {
    savedUserData = await LoginUserDataPrefs.getSavedLoginData();

    setState(() {
      username = savedUserData!.username;
    });
  }

  getcartid() async {
    await getCurUserData();
    await CartUserData.getcartfirebase(username!).then((list) async {
      print(list);
      if (!mounted) return;
      setState(() {
        cartproductid = list;
      });
    });
    print(cartproductid.length);
    return cartproductid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcartid();
  }

  cleanIdDetails() {
    setState(() {
      cartproductid = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("My Cart"),
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('availableProducts')
                  .snapshots(),
              builder: (_, snapshot) {
                List<Productdata> cartproduct_dataList = <Productdata>[];
                List<String> docid = [];

                if (snapshot.hasData) {
                  if (cartproductid.length != 0) {
                    snapshot.data!.docs
                        .forEach((DocumentSnapshot documentSnapshot) {
                      bool res = cartproductid.contains(documentSnapshot.id);
                      if (res) {
                        docid.add(documentSnapshot.id);
                        cartproduct_dataList
                            .add(Productdata.fromDocument(documentSnapshot));
                      }
                    });

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: ListView.builder(
                          itemCount: cartproduct_dataList.length,
                          itemBuilder: (context, i) {
                            if (cartproduct_dataList.isNotEmpty) {
                              return Card(
                                elevation: 5,
                                child: Container(
                                  height: s.height * 0.2,
                                  width: s.width * 0.8,
                                  child: Center(
                                    child: ListTile(
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => FeedItemsDetails(
                                                  productdata:
                                                      cartproduct_dataList[i],
                                                  docid: docid[i],
                                                  username: username)),
                                        ).then((value) => setState(() {
                                              cartproductid = [];
                                            }));
                                      },
                                      leading: Container(
                                          height: 100,
                                          width: 60,
                                          child: ClipOval(
                                            child: Image.network(
                                              cartproduct_dataList[i]
                                                  .imageurls![0],
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                      title: Text(cartproduct_dataList[i].name),
                                      subtitle: Text("\$ " +
                                          cartproduct_dataList[i]
                                              .price
                                              .toString()),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Text("Loading data please wait!");
                          }),
                    );
                  } else if (cartproductid.length == 0) {
                    getcartid();
                  }
                  return Center(
                    child: Text("No items in cart!"),
                  );
                } 

                return CircularProgressIndicator();
              },
            )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
