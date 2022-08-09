
import 'package:ecommerce_tutorials/models/category.dart';
import 'package:ecommerce_tutorials/models/categoryModal.dart';
import 'package:ecommerce_tutorials/repository/category_repository.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CategoryController extends GetxController {
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  CategoryRepository categoryRepository = CategoryRepository();
  RxInt skip = 0.obs;
  RxInt limit = 8.obs;
  Box settingBox = Get.find<Box>(tag: SETTINGS);
  @override
  void onInit() {
      fetchApi();
    

    super.onInit();
  }

  fetchApi() async {
    var data = await categoryRepository.fetchCategory(0, 8);
    categories.value = [];
    skip.value = limit.value;
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        categories.add(CategoryModel.fromMap(value));
      });
    }
  }

  fetchmore() async {
    var data = await categoryRepository.fetchCategory(skip.value, limit.value);
    if (data.data['code'] == 200) {
      Map<String, dynamic> res = data.data;
      List result = res['result'];
      result.forEach((value) {
        categories.add(CategoryModel.fromMap(value));
      });
      skip.value += limit.value;
    }
  }

  loadChild(List<CategoryModal> list) {
    categories.value = [];
    list.forEach((value) {
      categories.add(CategoryModel(
          id: value.id,
          name: value.name,
          icone: value.icone,
          parent_id: value.parent_id));
    });
    settingBox.put('child', 'load');
  }
}
