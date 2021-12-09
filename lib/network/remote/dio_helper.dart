import 'package:dio/dio.dart';

// Dio Helper is specified for APIs :

class DioHelper {
  // cuz i need to use an object for the functions :
  static Dio dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      // even when we have a status error recieve :
      receiveDataWhenStatusError: true,
      headers: {
        'lang': 'ar',
        'Content-Type': 'application/json',
      }));

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = 'ar',
    String? token,
  }) async {
    // i can NOT recall base option more than the first time :
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
