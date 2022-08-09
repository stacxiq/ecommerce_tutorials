import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/services/network.dart';

class CategoryRepository {
  Future<Response> fetchCategory(int skip, int limit) async {
    Map<String, dynamic> queryParams = {'skip': skip, 'limit': limit};
    return await Network.dio.get('get_categories', queryParameters: queryParams);
  }
}