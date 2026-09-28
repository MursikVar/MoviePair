import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_pair/core/network/dio_client.dart';
import 'package:movie_pair/core/security/security_storage.dart';
import 'package:movie_pair/features/auth/bloc/auth_bloc.dart';
import 'package:movie_pair/features/auth/data/auth_repository_impl.dart';
import 'package:movie_pair/features/auth/repos/auth_repository.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_bloc.dart';
import 'package:movie_pair/features/emailVerificated/data/verify_repository_impl.dart';
import 'package:movie_pair/features/emailVerificated/repos/verify_repository.dart';
import 'package:movie_pair/features/profile/bloc/profile_bloc.dart';
import 'package:movie_pair/features/profile/data/profile_repository_impl.dart';
import 'package:movie_pair/features/profile/repos/profile_repository.dart';

final getIt = GetIt.instance;

Future<void> initDependecies() async {
  getIt.registerLazySingleton<SecurityStorage>(() => SecurityStorage());
  getIt.registerLazySingleton<Dio>(() => DioClient.create());
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dio: getIt(), storage: getIt()),
  );
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(authRepository: getIt(), storage: getIt()),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(dio: getIt()),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(profileRepository: getIt()),
  );

  getIt.registerLazySingleton<VerifyRepository>(() => VerifyRepositoryImpl(dio: getIt()),);

  getIt.registerFactory<VerifyEmailBloc>(() => VerifyEmailBloc(verifyRepository: getIt()),);
}
