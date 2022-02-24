part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final User user;

  const RegisterSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

// ignore: must_be_immutable
class RegisterErrorState extends RegisterState {
  Exception? exception;
  String? error;

  RegisterErrorState.exception(this.exception);
  RegisterErrorState.error(this.error);

  @override
  List<Object?> get props => [exception, error];
}
