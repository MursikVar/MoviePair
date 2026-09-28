import 'package:dio/dio.dart';
import 'package:movie_pair/core/network/error_heandler.dart';
import 'package:movie_pair/features/profile/model/profile_model.dart';
import 'package:movie_pair/features/profile/model/profile_statistics.dart';
import 'package:movie_pair/features/profile/repos/profile_repository.dart';

class ProfileRepositoryImpl implements  ProfileRepository {
  final Dio _dio;

  ProfileRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<ProfileModel> getUserInfo() async {
    try {
      final response = await _dio.get('/profile/me');
      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    } catch (e) {
      throw ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }

  @override
  Future<ProfileStatistics> getUserStatistics() async {
    try {
      final response = await _dio.get('/profile/stats');
      return ProfileStatistics.fromJson(response.data);
    } on DioException catch (e) {
      throw dioError(e) ??
          ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    } catch (e) {
      throw ErrorHeandler(message: 'Упс...\n Мы не знаем такую ошибку');
    }
  }
}
