import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/app_exception.dart';

class LoginState {
  const LoginState({
    this.useEmail = true,
    this.rememberMe = false,
    this.identity = '',
    this.password = '',
    this.identityErrorMessage,
    this.passwordErrorMessage,
    this.generalErrorMessage,
  });

  final bool useEmail;
  final bool rememberMe;
  final String identity;
  final String password;

  final String? identityErrorMessage;
  final String? passwordErrorMessage;
  final String? generalErrorMessage;

  bool get isValid =>
      identityErrorMessage == null &&
      passwordErrorMessage == null &&
      identity.trim().isNotEmpty &&
      password.trim().isNotEmpty;

  LoginState copyWith({
    bool? useEmail,
    bool? rememberMe,
    String? identity,
    String? password,
    String? identityErrorMessage,
    String? passwordErrorMessage,
    String? generalErrorMessage,
  }) {
    return LoginState(
      useEmail: useEmail ?? this.useEmail,
      rememberMe: rememberMe ?? this.rememberMe,
      identity: identity ?? this.identity,
      password: password ?? this.password,
<<<<<<< HEAD
      identityErrorMessage: identityErrorMessage ?? this.identityErrorMessage,
      passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
      generalErrorMessage: generalErrorMessage ?? this.generalErrorMessage,
=======
      identityErrorMessage:
          identityErrorMessage ?? this.identityErrorMessage,
      passwordErrorMessage:
          passwordErrorMessage ?? this.passwordErrorMessage,
      generalErrorMessage:
          generalErrorMessage ?? this.generalErrorMessage,
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
    );
  }

  LoginState clearErrors() => copyWith(
        identityErrorMessage: null,
        passwordErrorMessage: null,
        generalErrorMessage: null,
      );
}

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  void toggleMode(bool useEmail) {
    state = LoginState(
      useEmail: useEmail,
      rememberMe: state.rememberMe,
    );
  }

  void setRememberMe(bool value) {
    state = state.copyWith(rememberMe: value);
  }

  void setIdentity(String value) {
<<<<<<< HEAD
    state = state.copyWith(identity: value, identityErrorMessage: null);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value, passwordErrorMessage: null);
=======
    state =
        state.copyWith(identity: value, identityErrorMessage: null);
  }

  void setPassword(String value) {
    state =
        state.copyWith(password: value, passwordErrorMessage: null);
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  }

  bool validate() {
    String? idError;
    String? passError;

    final id = state.identity.trim();
    final pwd = state.password.trim();

    if (id.isEmpty) {
      idError = state.useEmail ? 'Введите email' : 'Введите номер телефона';
<<<<<<< HEAD
    } else if (state.useEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(id)) {
=======
    } else if (state.useEmail &&
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(id)) {
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
      idError = 'Неверный формат email';
    }

    if (pwd.isEmpty) {
      passError = 'Введите пароль';
    } else if (pwd.length < 6) {
      passError = 'Пароль слишком короткий';
    }

    state = state.copyWith(
      identityErrorMessage: idError,
      passwordErrorMessage: passError,
      generalErrorMessage: null,
    );

    return idError == null && passError == null;
  }

  void applyBackendError(AppException exception) {
    switch (exception.code) {
      case AppErrorCode.invalidCredentials:
        state = state.copyWith(
          passwordErrorMessage: exception.message,
          generalErrorMessage: null,
        );
        break;
<<<<<<< HEAD

      case AppErrorCode.emailAlreadyExists:
      case AppErrorCode.phoneAlreadyExists:
        state = state.copyWith(identityErrorMessage: exception.message);
        break;

      case AppErrorCode.network:
        state = state.copyWith(generalErrorMessage: exception.message);
        break;

      case AppErrorCode.invalidOrExpiredToken:
      case AppErrorCode.validation:
      case AppErrorCode.unknown:
        state = state.copyWith(generalErrorMessage: exception.message);
=======
      case AppErrorCode.emailAlreadyExists:
      case AppErrorCode.phoneAlreadyExists:
        state = state.copyWith(
          identityErrorMessage: exception.message,
        );
        break;
      case AppErrorCode.network:
        state = state.copyWith(
          generalErrorMessage: exception.message,
        );
        break;
      case AppErrorCode.invalidOrExpiredToken:
      case AppErrorCode.validation:
      case AppErrorCode.unknown:
        state = state.copyWith(
          generalErrorMessage: exception.message,
        );
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
        break;
    }
  }
}

final loginProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(),
);
<<<<<<< HEAD
=======

>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
