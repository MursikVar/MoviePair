import 'package:dio/dio.dart';
import 'package:movie_pair/core/network/error_heandler.dart';
import 'package:movie_pair/core/security/security_storage.dart';
import 'package:movie_pair/features/auth/model/login/auth_login.dart';
import 'package:movie_pair/features/auth/model/registr/auth_register.dart';
import 'package:movie_pair/features/auth/model/response/auth_response.dart';
import 'package:movie_pair/features/auth/repos/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SecurityStorage _storage;

  AuthRepositoryImpl({required Dio dio, required SecurityStorage storage})
    : _dio = dio,
      _storage = storage;

  @override
  Future<AuthResponse> login(AuthLogin request) async {
    try {
      final response = await _dio.post('/auth/login', data: request.toJson());
      final authResponse = AuthResponse.fromJson(response.data);
      await _storage.saveToken(
        accessToken: authResponse.accessToken,
        refreshTokenKey: authResponse.refreshToken,
      );
      return authResponse;
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }

  @override
  Future<AuthResponse> registration(AuthRegister request) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: request.toJson(),
      );
      final authResponse = AuthResponse.fromJson(response.data);
      await _storage.saveToken(
        accessToken: authResponse.accessToken,
        refreshTokenKey: authResponse.refreshToken,
      );
      return authResponse;
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('/auth/logout');
      await _storage.isLogaut();
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }
}
