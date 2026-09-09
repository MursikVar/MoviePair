//Методы для работы с защищенным хранилищем

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage {
  static const String _accesTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  final storage = FlutterSecureStorage();

  Future<void> saveToken({
    required String accessToken,
    required String refreshTokenKey,
  }) async {
    await storage.write(key: _accesTokenKey, value: accessToken);
    await storage.write(key: _refreshTokenKey, value: refreshTokenKey);
  }

  Future<String?> readAccessToken () async {
    final String? accessToken =await storage.read(key: _accesTokenKey);
    return accessToken;
  }

  Future<String?> readRefreshTokenKey () async {
    final String? refreshTokenKey =await storage.read(key: _refreshTokenKey);
    return refreshTokenKey;
  }

  Future<void> isLogaut() async{
    await storage.deleteAll();
  }
}
