
import 'package:ecommerce_tutorials/repository/auth_repository.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AuthController extends GetxController {
  // loign
  final loginKey = GlobalKey<FormState>();
  final loginusernameController = TextEditingController();
  final loginpasswordController = TextEditingController();

  // register
  final registerKey = GlobalKey<FormState>();
  final registerusernameController = TextEditingController();
  final registerphoneController = TextEditingController();
  final registerpasswordController = TextEditingController();
  final registerconfirmpasswordController = TextEditingController();
  Box settingBox = Get.find<Box>(tag: SETTINGS);
  @override
  void onClose() {
    loginpasswordController.dispose();
    loginusernameController.dispose();
    registerusernameController.dispose();
    registerphoneController.dispose();
    registerpasswordController.dispose();
    registerconfirmpasswordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    Map<String, dynamic> userInfo = {
      'username': loginusernameController.text,
      'password': loginpasswordController.text
    };
    if (loginKey.currentState!.validate()) {
      print(registerusernameController.text);

      var response = await authRepository.login(userInfo);
      if (response.statusCode != 200) {
      } else {
        var data = response.data;
        settingBox.put('token', data['token']);
        // Get.off(BottomNavBar(0));
      }
    }
  }

  void register() async {
    if (registerKey.currentState!.validate()) {
      print(registerusernameController.text);
      Map<String, dynamic> userInfo = {
        'username': registerusernameController.text,
        'phone': registerphoneController.text,
        'password': registerpasswordController.text,
      };
      var response = await authRepository.register(userInfo);
      if (response.statusCode != 200) {
      } else {
        var data = response.data;
        settingBox.put('token', data['token']);
        // Get.off(BottomNavBar(0));
      }
    }
  }
}
