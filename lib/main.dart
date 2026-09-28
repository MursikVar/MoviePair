import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_pair/core/di/injection_conteiner.dart' as di;
import 'package:movie_pair/features/auth/bloc/auth_bloc.dart';
import 'package:movie_pair/features/auth/bloc/auth_event.dart';
import 'package:movie_pair/features/auth/bloc/auth_state.dart';
import 'package:movie_pair/features/auth/pages/auth_page.dart';
import 'package:movie_pair/features/emailVerificated/bloc/verify_email_bloc.dart';
import 'package:movie_pair/features/emailVerificated/page/verify_page.dart';
import 'package:movie_pair/features/profile/bloc/profile_bloc.dart';
import 'package:movie_pair/features/profile/bloc/profile_event.dart';
import 'package:movie_pair/features/profile/pages/profile_page.dart';
import 'package:movie_pair/features/settings/settings_page.dart';
import 'package:movie_pair/services/first_screen.dart';
import 'package:movie_pair/services/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //инициализация приложения до вызова runApp
  await di.initDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              di.getIt<AuthBloc>()..add(AuthEvent.checkAuthStatus()),
        ),
      ],
      child: MaterialApp(
        title: 'MoviePair',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF0E1014),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state.when(
                initial: () => SplashScreen(),
                loading: () => SplashScreen(),
                authenticated: () => BlocProvider<ProfileBloc>(
                  create: (context) =>
                      di.getIt<ProfileBloc>()..add(ProfileEvent.load()),
                  child: ProfilePage(),
                ),
                unauthenticated: () => FirstScreen(),
                error: (message) =>
                    Scaffold(body: Center(child: Text('Упс... $message'))),
              );
            },
          ),
          '/auth': (context) => const AuthPage(),
          '/settings': (context) =>
              const SettingsPage(), //TODO: оформить настройки(тут скоро будут настройки)
          '/profile': (context) => BlocProvider<ProfileBloc>(
            create: (context) =>
                di.getIt<ProfileBloc>()..add(ProfileEvent.load()),
            child: ProfilePage(),
          ),
          '/email-verificated': (context) => BlocProvider(
            create: (context) => di.getIt<VerifyEmailBloc>(),
            child: VerifyPage(),
          ),
        },
      ),
    );
  }
}
