import 'package:flutter/material.dart';
import 'package:movie_pair/features/auth/repos/auth_repository.dart';
import 'package:movie_pair/core/di/injection_conteiner.dart' as di;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // 1. Получаем репозиторий через DI
            final authRepo = di.getIt<AuthRepository>();
            // 2. Вызываем logout (очистит токены)
            await authRepo.logout();
            // 3. Переходим на экран входа или онбординга
            Navigator.of(context).pushReplacementNamed('/auth');
          },
          child: const Text('Выйти'),
        ),
      ),
    );
  }
}