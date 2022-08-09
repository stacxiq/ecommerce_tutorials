import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_tutorials/models/Brand.dart';
import 'package:ecommerce_tutorials/models/banner.dart';
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/repository/home_repository.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<Brand> brand = <Brand>[].obs;
  RxList<CategoryModel> category = <CategoryModel>[].obs;
  RxList<Product> products = <Product>[].obs;
  HomeRepository _homeRepository = HomeRepository();
  RxInt currentIndex = 0.obs;
  Box settingBox = Get.find<Box>(tag: SETTINGS);
  RxBool isLoading = false.obs;
  RxInt active = 0.obs;
  @override
  void onInit() {
    settingBox.put('child', 'loadParent');
    fetchApi();
    fetchBrands();
    fetchCategory();
    fetchProducts();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchApi() async {
    var data = await _homeRepository.fetchBanners();
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        banners.add(BannerModel.fromMap(value));
      });
    }
  }

  fetchBrands() async {
    var data = await _homeRepository.fetchBrands(0, 8);

    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        brand.add(Brand.fromMap(value));
      });
    }
  }

  fetchCategory() async {
    var data = await _homeRepository.fetchCategory(0, 8);

    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        category.add(CategoryModel.fromMap(value));
      });
    }
  }

  navigate_ads(BannerModel banner) {
    if (banner.type == 0) {
      // launchUrl(Uri.parse(banner.url!));
    } else {
      print('ali ${banner.products!.length}');

      // Get.to(() => Products(isRecommended: true, products: banner.products!));
    }
  }

  navigate_brand(Brand brand) {
    // Get.to(() => Products(
    //       isRecommended: true,
    //       id: brand.id,
    //       isCategory: false,
    //     ));
  }

  fetchProducts() async {
    var data = await _homeRepository.fetchFeaturedProducts(0, 8);

    products.value = [];
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        products.add(Product.fromMap(value));
      });
      isLoading.value = true;
    } else {
      isLoading.value = true;
    }
  }

  changePage(int index) {
    active.value = index;
  }
}
