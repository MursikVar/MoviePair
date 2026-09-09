import 'package:json_annotation/json_annotation.dart';


part 'auth_login.g.dart';

@JsonSerializable()
class AuthLogin {
  final String login;
  final String password;

  AuthLogin({required this.login, required this.password});

  Map<String, dynamic> toJson() => _$AuthLoginToJson(this);
}