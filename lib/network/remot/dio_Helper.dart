import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  //https://newsapi.org/
  // v2/everything?
  // q=tesla&from=2023-04-26&sortBy=publishedAt&apiKey=d17ebe0c22724983be64e23c7d2af76b

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData (
      {
        required String url ,
        required Map<String,dynamic> quary
      }) async
  {
    return await dio.get(url , queryParameters: quary);
  }
}