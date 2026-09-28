import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = Load;
  const factory ProfileEvent.refreshUserInfo() = RefreshUserInfo;
}