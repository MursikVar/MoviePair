import 'package:movie_pair/core/security/security_storage.dart';
import 'package:movie_pair/features/auth/bloc/auth_event.dart';
import 'package:movie_pair/features/auth/bloc/auth_state.dart';
import 'package:movie_pair/features/auth/model/login/auth_login.dart';
import 'package:movie_pair/features/auth/model/registr/auth_register.dart';
import 'package:movie_pair/features/auth/repos/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final SecurityStorage _storage;

  AuthBloc({
    required AuthRepository authRepository,
    required SecurityStorage storage,
  }) : _authRepository = authRepository,
       _storage = storage,
       super(AuthState.initial()) {
    on<CheckAuthStatus>((event, emit) async {
      final _token = await _storage.readAccessToken();
      emit(AuthState.loading());
      if (_token != null) {
        emit(AuthState.authenticated());
      } else {
        emit(AuthState.unauthenticated());
      }
    });
    on<Login>((event, emit) async {
      emit(AuthState.loading());
      try {
        final request = AuthLogin(login: event.login, password: event.password);
        await _authRepository.login(request);
        emit(AuthState.authenticated());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
    on<Register>((event, emit) async {
      emit(AuthState.loading());
      try {
        final request = AuthRegister(
          login: event.login,
          password: event.password,
          userName: event.userName,
        );
        await _authRepository.registration(request);
        emit(AuthState.authenticated());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
    on<Logout>((event, emit) async {
      emit(AuthState.loading());
      try {
        await _authRepository.logout();
        emit(AuthState.unauthenticated());
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
  }
}
