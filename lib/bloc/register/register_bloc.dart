import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_little_sea_house/exceptions/form_exceptions.dart';
import 'package:my_little_sea_house/models/user_model.dart';
import 'package:my_little_sea_house/repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late UserRepository _userRepository;

  RegisterBloc() : super(RegisterInitialState()) {
    _userRepository = UserRepository();

    on<RegisterRequestEvent>((event, emit) async {
      emit(RegisterLoadingState());

      try {
        final user = await _userRepository.signUp(
          email: event.email,
          password: event.password,
        );

        if (user == null) {
          emit(RegisterErrorState.error('Registration: User yielded is null.'));
        } else {
          emit(RegisterSuccessState(user));
        }
      } on FormGeneralException catch (e) {
        emit(RegisterErrorState.exception(e));
      } on FormFieldsException catch (e) {
        emit(RegisterErrorState.exception(e));
      } catch (e) {
        emit(RegisterErrorState.exception(
          FormGeneralException(message: 'Unidentified error'),
        ));
      }
    });

    on<RegisterRestartEvent>((event, emit) async {
      emit(RegisterInitialState());
    });
  }
}
