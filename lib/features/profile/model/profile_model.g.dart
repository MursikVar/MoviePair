// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  userName: json['username'] as String,
  emailVerified: json['email_verified'] as bool,
  login: json['login'] as String,
  userId: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'email_verified': instance.emailVerified,
      'username': instance.userName,
      'id': instance.userId,
    };
