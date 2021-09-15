import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartUserData {
  static Future addtousercart(String? id, String? username) async {
    final _activeusercart = FirebaseFirestore.instance.collection("cart");
    List<String> data = <String>[
      id!,
    ];

    await _activeusercart
        .doc(username)
        .update({"cartproduct": data})
        .whenComplete(() => print(" added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> appendToArray(
      String username, dynamic newProductID) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot doc =
        await _firestore.collection('cart').doc(username).get();
    if (doc.exists) {
      await _firestore.collection('cart').doc(username).update({
        'cartproduct': FieldValue.arrayUnion([newProductID]),
      });
    } else {
      final _activeusercart = FirebaseFirestore.instance.collection("cart");
      List<String> data = <String>[
        newProductID!,
      ];
      await _activeusercart
          .doc(username)
          .set({"cartproduct": data})
          .whenComplete(() => print(" added to the database"))
          .catchError((e) => print(e));
    }
  }

  static Future<void> removeFromArray(String username, dynamic prod_Id) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _firestore.collection('cart').doc(username).update({
      'cartproduct': FieldValue.arrayRemove([prod_Id]),
    });
  }

  static Future getcartfirebase(String? username) async {
    final _firestore = FirebaseFirestore.instance.collection('cart');
    DocumentSnapshot docSnap = await _firestore.doc(username).get();
    List<String> cartdata = List.from(docSnap['cartproduct']);
    print(username);
    print(cartdata);
    return cartdata;
  }

  static Future showcartfirebase(List<String> proddocid) async {
    final _sam = FirebaseFirestore.instance.collection("availableProducts");
    List<Productdata> cartdata = <Productdata>[];
    proddocid.forEach((id) async {
      DocumentSnapshot samdocSnap = await _sam.doc(id).get();
      Productdata pd = Productdata.fromDocument(samdocSnap);
      cartdata.add(pd);
      print(pd.name);
    });
    return cartdata;
  }
}
