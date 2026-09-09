// Файл кода для автоматического подставления токенов при запросах
import 'package:dio/dio.dart';
import 'package:movie_pair/core/security/security_storage.dart';

class AuthInterceptor extends Interceptor {
  final _storage = SecurityStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains('/auth/register')) {
      return handler.next(options);
    } else if (options.path.contains('/auth/login')) {
      return handler.next(options);
    }

    _storage
        .readAccessToken()
        .then((token) {
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        })
        .catchError((error) {
          handler.next(options);
        });
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if(err.response?.statusCode == 401){
      _storage.isLogaut();
    }
    handler.next(err);
  }
}
