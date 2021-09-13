import 'package:cloud_firestore/cloud_firestore.dart';

class CartUserData {
  
  
  static Future addtousercart(String? id, String? username) async {
    final _activeusercart =
      FirebaseFirestore.instance.collection("cart");
    List<String> data = <String>[
      id!,
    ];
    await _activeusercart
    .doc(username)
    .update({"cartproduct": data})
    .whenComplete(() => print(" added to the database"))
    .catchError((e) => print(e));
  }
}
