import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_pair/features/profile/model/profile_model.dart';
import 'package:movie_pair/features/profile/model/profile_statistics.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded({
    required ProfileModel profile,
    required ProfileStatistics profileStatistics,
  }) = Loaded;
  const factory ProfileState.error(String error) = Error;
}
