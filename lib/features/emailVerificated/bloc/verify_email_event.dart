import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_event.freezed.dart';

@freezed
abstract class VerifyEmailEvent with _$VerifyEmailEvent {
  const factory VerifyEmailEvent.callSendCode() = CallSendCode;
  const factory VerifyEmailEvent.sendCode( {required String code}) = SendCode;
  const factory VerifyEmailEvent.reset() = Reset;
}