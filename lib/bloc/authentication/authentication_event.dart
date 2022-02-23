import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent() : super();
}

class AppStartedEvent extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object?> get props => [];
}

class AuthAuthenticateEvent extends AuthenticationEvent {
  final User user;

  const AuthAuthenticateEvent(this.user);

  @override
  String toString() => 'LoggedIn';

  @override
  List<Object> get props => [user];
}

class AuthLogoutEvent extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';

  @override
  List<Object?> get props => [];
}
