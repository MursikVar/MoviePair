// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRegister _$AuthRegisterFromJson(Map<String, dynamic> json) => AuthRegister(
  login: json['login'] as String,
  password: json['password'] as String,
  userName: json['username'] as String,
);

Map<String, dynamic> _$AuthRegisterToJson(AuthRegister instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'username': instance.userName,
    };
