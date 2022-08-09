import 'package:dio/dio.dart';
import 'package:ecommerce_tutorials/utils/constant.dart';

class Network {
  static final dio = Dio(
    BaseOptions(
      baseUrl: base_url,
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<void> initializeInterceptors() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) async {
        var headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        };
        print(request.uri);
        request.headers.addAll(headers);
        return handler.next(request); //continue
      },
      onResponse: (response, handler) {
        print(response.data);
        return handler.next(response); // continue
      },
      onError: (error, handler) {
        return handler.next(error); //continue
      },
    ));
  } // end of initializeInterceptor
}
