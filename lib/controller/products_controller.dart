
import 'package:ecommerce_tutorials/models/product.dart';
import 'package:ecommerce_tutorials/repository/products_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  String id;
  bool isCategory;
  ProductsController({
    required this.id,
    required this.isCategory,
  });
  ProductsRepository productsRepository = ProductsRepository();

  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    if (isCategory) {
      fetchProductsByCategory(id);
    } else {
      fetchProductsByBrand(id);
    }
    super.onInit();
  }

  fetchProductsByCategory(String id) async {
    var data = await productsRepository.fetchProductByCategory(0, 8, id);
    products.value = [];
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        products.add(Product.fromMap(value));
      });
    }
  }

  fetchProductsByBrand(String id) async {
    var data = await productsRepository.fetchProductByBrand(0, 8, id);
    products.value = [];
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        products.add(Product.fromMap(value));
      });
    }
  }
}
