import 'package:dio/dio.dart';

// Dio Helper is specified for APIs :

class DioHelper {
  // cuz i need to use an object for the functions :
  static Dio dio = 1 as Dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      // even when we have a status error recieve :
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
