import 'package:dio/dio.dart';

// Dio Helper is specified for APIs :

class DioHelper {
  // cuz i need to use an object for the functions :
  static late Dio dio;

  static init() {
    dio = dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      // even when we have a status error recieve :
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    // i can NOT recall base option more than the first time :
    // this header delete the headers that are initialized before ( Sometimes ):
    dio.options.headers = {
      'lang': lang,
      // if ther is no token make it as null :
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
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
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
