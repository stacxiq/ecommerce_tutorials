import 'package:ecommerce_tutorials/controller/category_controller.dart';
import 'package:ecommerce_tutorials/controller/home_controller.dart';
import 'package:ecommerce_tutorials/services/network.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InitiaalizeApp {
  static init_app() async {
    await Network.initializeInterceptors();

    await Hive.initFlutter();

    final Box settingBox = await Hive.openBox(SETTINGS);
    Get.put<Box>(settingBox, tag: SETTINGS);

    Get.put<HomeController>(HomeController());
    Get.put<CategoryController>(CategoryController());
  }
}
