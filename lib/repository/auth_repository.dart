import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/services/network.dart';

class AuthRepository {
  Future<Response> login(Map<String, dynamic> userInfo) async {
    Map<String, dynamic> queryParams = {
      'phone_number': userInfo['username'],
      'password': userInfo['password']
    };
    return await Network.dio.post('login', data: jsonEncode(queryParams));
  }

  Future<Response> register(Map<String, dynamic> userInfo) async {
    Map<String, dynamic> reg_data = {
      'phone_number': userInfo['phone'],
      'password': userInfo['password'],
      'user_name': userInfo['username'],
    };
    print(reg_data);
    return await Network.dio.post('register', data: jsonEncode(reg_data));
  }
}

final authRepository = AuthRepository();
