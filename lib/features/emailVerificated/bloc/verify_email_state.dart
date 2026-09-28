import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory  VerifyEmailState.initial() = Initial;
  const factory  VerifyEmailState.loading() = Loading;
  const factory  VerifyEmailState.codeSend() = CodeSend;
  const factory  VerifyEmailState.verified() = Verified;
  const factory  VerifyEmailState.error(String error) = Error;
}