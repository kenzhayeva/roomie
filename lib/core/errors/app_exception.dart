enum AppErrorCode {
  invalidCredentials,
  emailAlreadyExists,
  phoneAlreadyExists,
  invalidOrExpiredToken,
  validation,
  network,
  unknown,
}

class AppException implements Exception {
  const AppException({
    required this.code,
    required this.message,
    this.field,
  });

  final AppErrorCode code;
  final String message;
  final String? field;
}
<<<<<<< HEAD
=======

>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
