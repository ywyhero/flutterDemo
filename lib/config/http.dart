import 'package:dio/dio.dart';
import 'dart:async';
class HttpRequest {
  static final Dio dio = new Dio();
  static Future<T> request<T> (String url, {String method = 'get', Map<String, dynamic> params}) async {
    final options =  Options(method: method);
    try{
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }
  }
}