import 'package:cloud_firestore/cloud_firestore.dart';

class Productdata {
  List<dynamic>? imageurls;
  int? instock;
  String name;
  int? price;

  Productdata({this.imageurls, this.instock, required this.name, this.price});

  factory Productdata.fromDocument(DocumentSnapshot doc) {
    return Productdata(
      imageurls: List.from(doc['images']),
      instock: doc['instock'],
      name: doc['name'],
      price: doc['price'],
    );
  }
}
