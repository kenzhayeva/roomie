<<<<<<< HEAD
import 'package:flutter/foundation.dart';

class ApiConfig {
  static const String _localBaseUrl = 'http://localhost:3001/api';
  static const String _androidEmulatorBaseUrl = 'http://10.0.2.2:3001/api';

  // Егер public file server бөлек болмаса — baseUrl-дың доменін қолданамыз
  static const String _localPublicBaseUrl = 'http://localhost:3001';
  static const String _androidEmulatorPublicBaseUrl = 'http://10.0.2.2:3001';

  static String get baseUrl {
    const envUrl = String.fromEnvironment('API_BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;

    if (kIsWeb) return _localBaseUrl;

    return defaultTargetPlatform == TargetPlatform.android
        ? _androidEmulatorBaseUrl
        : _localBaseUrl;
  }

  static String get publicBaseUrl {
    const envUrl = String.fromEnvironment('PUBLIC_BASE_URL');
    if (envUrl.isNotEmpty) return envUrl;

    if (kIsWeb) return _localPublicBaseUrl;

    return defaultTargetPlatform == TargetPlatform.android
        ? _androidEmulatorPublicBaseUrl
        : _localPublicBaseUrl;
  }

  const ApiConfig._();
}
=======
import 'api_config_stub.dart'
    if (dart.library.io) 'api_config_io.dart' as _impl;

class ApiConfig {
  static String get baseUrl => _impl.getApiBaseUrl();
  static String get publicBaseUrl => _impl.getPublicBaseUrl();
  const ApiConfig._();
}
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
