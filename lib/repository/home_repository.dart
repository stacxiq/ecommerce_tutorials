import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/services/network.dart';

class HomeRepository {
  Future<Response> fetchBanners() async {
    return await Network.dio.get('get_ads');
  }

  Future<Response> fetchBrands(int skip, int limit) async {
    Map<String, dynamic> queryParams = {'skip': skip, 'limit': limit};
    return await Network.dio.get('get_brands', queryParameters: queryParams);
  }

  Future<Response> fetchCategory(int skip, int limit) async {
    Map<String, dynamic> queryParams = {'skip': skip, 'limit': limit};
    return await Network.dio.get('get_categories', queryParameters: queryParams);
  }
  Future<Response> fetchFeaturedProducts(int skip, int limit) async {
    Map<String, dynamic> queryParams = {'skip': skip, 'limit': limit};
    return await Network.dio.get('get_products', queryParameters: queryParams);
  }
}
