import 'package:json_annotation/json_annotation.dart';

part 'auth_register.g.dart';

@JsonSerializable()
class AuthRegister {
  final String login;

  final String password;

  @JsonKey(name: 'username')
  final String userName;

  AuthRegister({required this.login, required this.password, required this.userName});

  Map<String, dynamic> toJson() => _$AuthRegisterToJson(this);
}
