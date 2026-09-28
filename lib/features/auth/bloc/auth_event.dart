import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;
  const factory AuthEvent.login({required String login, required String password}) = Login;
  const factory AuthEvent.register({required String login, required String password, required String userName}) = Register;
  const factory AuthEvent.logout() = Logout;
}