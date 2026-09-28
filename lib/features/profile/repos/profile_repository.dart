import 'package:movie_pair/features/profile/model/profile_model.dart';
import 'package:movie_pair/features/profile/model/profile_statistics.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getUserInfo();

  Future<ProfileStatistics> getUserStatistics();
}