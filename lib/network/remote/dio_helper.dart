import 'package:dio/dio.dart';

// Dio Helper is specified for APIs :

class DioHelper {
  // cuz i need to use an object for the functions :
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        // even when we have a status error recieve :
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
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

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
