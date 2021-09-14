import 'package:flutter/material.dart';

class Cartview extends StatefulWidget {
  Cartview({Key? key}) : super(key: key);

  @override
  _CartviewState createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("My Cart"),
      ),
      body: Center(
        child: Text("Cart"),
      ),
    );
  }
}
