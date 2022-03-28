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
  String? error;

  LoginFailureState(this.error);

  @override
  List<Object?> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
