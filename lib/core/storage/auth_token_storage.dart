import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthTokenStorage {
  static const _accessTokenKey = 'auth_access_token';
  static const _refreshTokenKey = 'auth_refresh_token';

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> setAccessToken(String accessToken) async {
<<<<<<< HEAD
    await _secureStorage.write(
      key: _accessTokenKey,
      value: accessToken,
    );
=======
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  }

  Future<String?> getAccessToken() async {
    return _secureStorage.read(key: _accessTokenKey);
  }

  Future<void> saveRefreshToken({
    required String refreshToken,
    required bool rememberMe,
  }) async {
    if (rememberMe) {
<<<<<<< HEAD
      await _secureStorage.write(
        key: _refreshTokenKey,
        value: refreshToken,
      );
=======
      await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    } else {
      await _secureStorage.delete(key: _refreshTokenKey);
    }
  }

  Future<String?> getRefreshToken() async {
    return _secureStorage.read(key: _refreshTokenKey);
  }

  Future<void> clear() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
