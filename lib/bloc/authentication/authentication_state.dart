import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UninitializedState extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthAuthenticatedState extends AuthenticationState {
  final User user;

  const AuthAuthenticatedState({required this.user});

  @override
  String toString() => 'Authenticated { user: $user }';

  @override
  List<Object> get props => [user];
}

class UnauthenticatedState extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}

class AuthenticationFailureState extends AuthenticationState {
  final String error;

  const AuthenticationFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthenticationFailure { error: $error }';
}
