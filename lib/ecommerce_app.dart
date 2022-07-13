import 'package:ecommerce_tutorials/pages/splash.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Tajawal'),
      home: SplashPage(),
    );
  }
}
