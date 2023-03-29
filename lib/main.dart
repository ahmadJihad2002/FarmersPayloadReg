import 'package:flutter/material.dart';
import 'package:untitled/layout/drowerTaps/aboutMe.dart';
import 'package:untitled/modules/addNewBill.dart';
import 'package:untitled/modules/addNewFarmer.dart';
import 'package:untitled/modules/farmerpage.dart';
import 'package:untitled/modules/farmers.dart';
import 'package:untitled/layout/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (BuildContext context) => Home(),
        '/about': (BuildContext context) => AboutMe(),
        '/addNewFarmer': (BuildContext context) => AddNewFarmer(),
        '/addNewBill': (BuildContext context) => AddNewBill(),
        '/farmerPage': (BuildContext context) => FarmerPage(),
        // '/wishlist': (BuildContext context) => WishList(),
        // '/cart': (BuildContext context) => CartList(),
        // '/settings': (BuildContext context) => Settings(),
        // '/products': (BuildContext context) => Products(),
        // '/about': (BuildContext context) => About()
      },
      home: SafeArea(
        child: Farmers(),
      ),
    );
  }
}
