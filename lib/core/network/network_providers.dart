import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/auth_token_storage.dart';
import 'api_config.dart';

final authTokenStorageProvider = Provider<AuthTokenStorage>(
  (ref) => AuthTokenStorage(),
);

final dioProvider = Provider<Dio>((ref) {
  final tokenStorage = ref.read(authTokenStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await tokenStorage.getAccessToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        // ignore: avoid_print
<<<<<<< HEAD
        print(
          '[Dio] Error: ${error.requestOptions.method} ${error.requestOptions.uri}',
        );
=======
        print('[Dio] Error: ${error.requestOptions.method} ${error.requestOptions.uri}');
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
        // ignore: avoid_print
        print('[Dio] statusCode=$statusCode data=$data');
        handler.next(error);
      },
    ),
  );

  return dio;
<<<<<<< HEAD
});
=======
});
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
