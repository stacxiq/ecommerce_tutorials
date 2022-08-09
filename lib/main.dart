import 'package:ecommerce_tutorials/ecommerce_app.dart';
import 'package:ecommerce_tutorials/init_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() async {
  await InitiaalizeApp.init_app();
  runApp(EcommerceApp());
}
