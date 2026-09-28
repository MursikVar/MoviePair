import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String login;

  @JsonKey(name: 'email_verified')
  final bool emailVerified;

  @JsonKey(name: 'username')
  final String userName;

  @JsonKey(name: 'id')
  final int? userId;

  ProfileModel({required this.userName,required this.emailVerified,required this.login,this.userId,});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  
}