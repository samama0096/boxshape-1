import 'package:boxshape/Helpers/models/product.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductFirebaseService {
  static Future<List<Productdata>> getproductsfirebase() async {
    final products = FirebaseFirestore.instance.collection("availableProducts");
    List<Productdata> productInfo = <Productdata>[];
    //DocumentSnapshot docsnap = await _products.doc().get();
    await products.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        Productdata pd = Productdata.fromDocument(doc);
        productInfo.add(pd);
      });
    });
    print(productInfo.length);
    return productInfo;
  }

  static Future updatestock(String pid, int astock) async {
    final products = FirebaseFirestore.instance.collection("availableProducts");

    await products.doc(pid).update({'instock': astock});
  }
}
