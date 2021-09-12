import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});
}

String dummyText =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
List<Product> products = [
  Product(
      image: "lib/assets/images/p1.jpg",
      title: "Casual",
      description: dummyText,
      price: 20,
      size: 11,
      id: 1,
      color: Colors.transparent),
  Product(
      image: "lib/assets/images/p2.jpg",
      title: "Formal",
      description: dummyText,
      price: 45,
      size: 14,
      id: 2,
      color: Colors.transparent),
  Product(
      image: "lib/assets/images/p3.jpg",
      title: "Casual II",
      description: dummyText,
      price: 25,
      size: 09,
      id: 3,
      color: Colors.transparent),
  Product(
      image: "lib/assets/images/p4.jpg",
      title: "Casual W",
      description: dummyText,
      price: 33,
      size: 14,
      id: 4,
      color: Colors.transparent),
  Product(
      image: "lib/assets/images/p5.jpg",
      title: "Casual III",
      description: dummyText,
      price: 58,
      size: 13,
      id: 5,
      color: Colors.transparent),
  Product(
      image: "lib/assets/images/p6.jpg",
      title: "Formal II",
      description: dummyText,
      price: 50,
      size: 18,
      id: 6,
      color: Colors.transparent),
];
