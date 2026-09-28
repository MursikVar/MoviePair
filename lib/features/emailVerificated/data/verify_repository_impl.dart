import 'package:dio/dio.dart';
import 'package:movie_pair/core/network/error_heandler.dart';
import 'package:movie_pair/features/emailVerificated/model/verify_email_model.dart';
import 'package:movie_pair/features/emailVerificated/model/verify_model_response.dart';
import 'package:movie_pair/features/emailVerificated/repos/verify_repository.dart';

class VerifyRepositoryImpl implements VerifyRepository {
  final Dio _dio;

  VerifyRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> callSendCode() async {
    try {
      await _dio.post('/profile/send-verification');
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }

  @override
  Future<VerifyModelResponse> sendEmailCode(VerifyEmailModel request) async {
    try {
      final response = await _dio.post(
        '/profile/verify-email',
        data: request.toJson(),
      );
      final codeResponse = VerifyModelResponse.fromJson(response.data);
      return codeResponse;
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }
}
