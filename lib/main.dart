import 'package:flutter/material.dart';

//import 'Seller/home_screen/HomePage.dart';
import 'client/views/home_screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my mobile app',
      //theme: ThemeData(),
      home: Home(),
    );
  }
}
