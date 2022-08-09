import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/pages/home/widgets/category.dart';
import 'package:ecommerce_tutorials/pages/home/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('الرئيسية'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [CategoryWidget(), ProductWidget()],
        ),
      ),
    );
  }
}
