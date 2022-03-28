import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_little_sea_house/bloc/login/login_event.dart';
import 'package:my_little_sea_house/bloc/login/login_state.dart';
import 'package:my_little_sea_house/exceptions/form_exceptions.dart';
import 'package:my_little_sea_house/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late UserRepository _userRepository;

  LoginBloc() : super(LoginInitialState()) {
    _userRepository = UserRepository();

    on<LoginRequestEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final user = await _userRepository.signInWithCredentials(
          email: event.email,
          password: event.password,
        );

        if (user == null) {
          emit(LoginFailureState('Login: User yielded is null.'));
        } else {
          emit(
            LoginSuccessState(
              user,
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        emit(LoginFailureState(e.message.toString()));
      } on Exception catch (e) {
        emit(LoginFailureState('Login failed'));
      }
    });
  }
}
