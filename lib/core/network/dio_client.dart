//Общие настройки сетевого пакета
import 'package:dio/dio.dart';
import 'package:movie_pair/core/network/auth_interceptor.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://moviepair.ru',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),

    );
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true
    ));
    return dio;
  }
}
