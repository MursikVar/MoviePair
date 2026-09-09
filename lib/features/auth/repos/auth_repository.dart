//Интерфейс для API запросов

import 'package:movie_pair/features/auth/model/login/auth_login.dart';
import 'package:movie_pair/features/auth/model/registr/auth_register.dart';
import 'package:movie_pair/features/auth/model/response/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(AuthLogin request);

  Future<AuthResponse> registration(AuthRegister request);

  // Future<User> getUser();

  Future<void> logout();
}