import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/services/network.dart';

class CheckoutRepository {
  Future<Response> checkout(Map<String, dynamic> data) async {
    return await Network.dio.post('add_order', data: jsonEncode(data));
  }
}
final checkoutRepository = CheckoutRepository();