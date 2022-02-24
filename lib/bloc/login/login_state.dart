import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User user;

  const LoginSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

// ignore: must_be_immutable
class LoginFailureState extends LoginState {
  Exception? exception;
  String? error;

  LoginFailureState.exception(this.exception);
  LoginFailureState.error(this.error);

  @override
  List<Object?> get props => [exception, error];

  @override
  String toString() => 'LoginFailure { exception: $exception, error: $error }';
}
