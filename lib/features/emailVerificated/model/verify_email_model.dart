import 'package:json_annotation/json_annotation.dart';

part 'verify_email_model.g.dart';

@JsonSerializable()
class VerifyEmailModel {
  @JsonKey(name: 'code')
  final String emailCode;

  VerifyEmailModel({required this.emailCode});

  Map<String, dynamic> toJson() => _$VerifyEmailModelToJson(this);
}