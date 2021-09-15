import 'package:boxshape/Firebase/services/cart.firebase.dart';
import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cartview extends StatefulWidget {
  Cartview({Key? key}) : super(key: key);

  @override
  _CartviewState createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  Userdata? savedUserData;
  String? username;
  List<String> cartproductid = [];
  List<Productdata> cartdata = <Productdata>[];
  getCurUserData() async {
    savedUserData = await LoginUserDataPrefs.getSavedLoginData();

    setState(() {
      username = savedUserData!.username;
    });
    print(savedUserData);
  }

  getcartid() async {
    await getCurUserData();
    await CartUserData.getcartfirebase(username!).then((list) {
      setState(() {
        cartproductid = list;
      });
    });
    await CartUserData.showcartfirebase(cartproductid).then((list) {
      setState(() {
        cartdata = list;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcartid();
  }

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
                itemCount: cartproductid.length,
                itemBuilder: (context, index) {
                  if (cartdata.isNotEmpty) {
                    return ListTile(
                      title: Text(cartdata[index].name),
                    );
                  }
                  return CircularProgressIndicator();
                })),
      ),
    );
  }
}
