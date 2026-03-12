<<<<<<< HEAD
﻿import 'package:dio/dio.dart';
=======
import 'package:dio/dio.dart';
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2

import '../errors/app_exception.dart';

AppException mapDioErrorToAppException(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.type == DioExceptionType.receiveTimeout ||
      error.type == DioExceptionType.connectionError) {
    return const AppException(
      code: AppErrorCode.network,
      message: 'Нет подключения к серверу. Проверьте интернет.',
    );
  }

  final res = error.response;
  final data = res?.data;
  String? rawMessage;

  if (data is Map<String, dynamic>) {
    final m = data['message'];
    if (m is String) {
      rawMessage = m;
    } else if (m is List && m.isNotEmpty) {
      rawMessage = m.first.toString();
    }
  } else if (data is String) {
    rawMessage = data;
  }

  final status = res?.statusCode;
  final normalized = (rawMessage ?? '').toLowerCase();

  if (status == 401 &&
      normalized.contains('invalid') &&
      (normalized.contains('credential') || normalized.contains('password'))) {
    return const AppException(
      code: AppErrorCode.invalidCredentials,
      message: 'Неверный логин или пароль.',
      field: 'password',
    );
  }

  if (status == 409 &&
      normalized.contains('email') &&
      (normalized.contains('exist') || normalized.contains('already'))) {
    return const AppException(
      code: AppErrorCode.emailAlreadyExists,
      message: 'Этот email уже был зарегистрирован.',
      field: 'email',
    );
  }

  if (status == 409 &&
      (normalized.contains('phone') || normalized.contains('number')) &&
      (normalized.contains('exist') || normalized.contains('already'))) {
    return const AppException(
      code: AppErrorCode.phoneAlreadyExists,
      message: 'Этот номер уже был зарегистрирован.',
      field: 'phone',
    );
  }

  if (status == 401 &&
      normalized.contains('token') &&
      (normalized.contains('invalid') ||
          normalized.contains('expired') ||
          normalized.contains('revoked'))) {
    return const AppException(
      code: AppErrorCode.invalidOrExpiredToken,
<<<<<<< HEAD
      message: 'Сессия истекла. Войдите снова.',
=======
      message: 'Сессия истекла. Войдите заново.',
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    );
  }

  if (status == 400) {
    return const AppException(
      code: AppErrorCode.validation,
<<<<<<< HEAD
      message: 'Проверьте корректность введенных данных.',
=======
      message: 'Проверьте правильность введённых данных.',
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    );
  }

  if (status != null && status >= 500) {
    return const AppException(
      code: AppErrorCode.network,
<<<<<<< HEAD
      message: 'Ошибка сервера. Попробуйте позже.',
=======
      message: 'Сервер недоступен. Попробуйте позже.',
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    );
  }

  return const AppException(
    code: AppErrorCode.unknown,
<<<<<<< HEAD
    message: 'Что-то пошло не так. Попробуйте еще раз.',
=======
    message: 'Что-то пошло не так. Попробуйте ещё раз.',
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  );
}

