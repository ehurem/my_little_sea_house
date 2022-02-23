import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_event.dart';
import 'package:my_little_sea_house/bloc/authentication/authentication_state.dart';
import 'package:my_little_sea_house/models/user_model.dart' as user_model;
import 'package:my_little_sea_house/repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late UserRepository _userRepository;

  AuthenticationBloc(UserRepository userRepository)
      : super(UninitializedState()) {
    _userRepository = userRepository;

    on<AuthLogoutEvent>((event, emit) async {
      _userRepository.signOut();
      emit(UnauthenticatedState());
    });

    on<AppStartedEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        bool isSignedIn = await _userRepository.isSignedIn();

        if (isSignedIn) {
          User? user = await _userRepository.getUser();
          user_model.User myUser = user_model.User(
              id: user!.uid,
              displayName: user.displayName,
              email: user.email,
              phone: user.phoneNumber,
              imageUrl: user.photoURL);
          emit(AuthAuthenticatedState(user: myUser));
        } else {
          emit(UnauthenticatedState());
        }
      } catch (e) {
        emit(AuthenticationFailureState(error: e.toString()));
      }
    });

    on<AuthAuthenticateEvent>((event, emit) async {
      emit(AuthAuthenticatedState(user: event.user));
    });
  }
}
