import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/services/network.dart';

class ProductsRepository {

    Future<Response> fetchProductByCategory(int skip, int limit, String id) async {
    Map<String, dynamic> queryParams = { 'category_id': id ,'skip': skip, 'limit': limit};
    return await Network.dio.get('get_products', queryParameters: queryParams);
  }
    Future<Response> fetchProductByBrand(int skip, int limit, String id) async {
    Map<String, dynamic> queryParams = { 'brand_id': id ,'skip': skip, 'limit': limit};
    return await Network.dio.get('get_products', queryParameters: queryParams);
  }
}
