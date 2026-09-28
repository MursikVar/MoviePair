import 'package:json_annotation/json_annotation.dart';

part 'verify_model_response.g.dart';

@JsonSerializable()
class VerifyModelResponse {
  @JsonKey(name: 'verified')
  final bool emailStatus;

   VerifyModelResponse({required this.emailStatus});

   factory VerifyModelResponse.fromJson(Map<String, dynamic> json) => _$VerifyModelResponseFromJson(json);
}