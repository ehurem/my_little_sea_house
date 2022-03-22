part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterRequestEvent extends RegisterEvent {
  final String email;
  final String password;

  const RegisterRequestEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class RegisterRestartEvent extends RegisterEvent {
  @override
  String toString() => 'Reset Register';

  @override
  List<Object?> get props => [];
}
