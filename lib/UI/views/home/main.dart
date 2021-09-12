import 'package:boxshape/UI/views/home/constants.dart';
import 'package:boxshape/UI/views/home/ui/home.dart';
import 'package:flutter/material.dart';
//import 'package:onlinestore/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FLutter Demo",
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomeScren(),
    );
  }
}
