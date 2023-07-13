import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/sign_up/sign_up_event.dart';
import 'package:flutter_to_do/_src/application/authentication/sign_up/sign_up_state.dart';
import 'package:flutter_to_do/_src/model/user/user_model.dart';
import 'package:flutter_to_do/_src/repository/auth_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitState()) {
    on<SignUpEmailInputEvent>(_emailInput);
    on<SignUpPasswordInputEvent>(_passwordInput);
    on<SignUpRePasswordInputEvent>(_rePasswordInput);
    on<SignUpSubmittedEvent>(_submitted);
    on<SignUpValidateEvent>(_validate);
  }

  Future<void> _validate(
      SignUpValidateEvent evnet, Emitter<SignUpState> emit) async {
    if (state.email != null &&
        state.password != null &&
        state.rePassword != null) {
      emit(SignUpSubmitState(
          email: state.email,
          password: state.password,
          rePassword: state.rePassword));
    }
  }

  Future<void> _emailInput(
      SignUpEmailInputEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpInputState(
        email: event.value,
        password: state.password,
        rePassword: state.rePassword));
    add(SignUpValidateEvent());
  }

  Future<void> _passwordInput(
      SignUpPasswordInputEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpInputState(
        password: event.value,
        email: state.email,
        rePassword: state.rePassword));
    add(SignUpValidateEvent());
  }

  Future<void> _rePasswordInput(
      SignUpRePasswordInputEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpInputState(
        rePassword: event.value, email: state.email, password: state.password));
    add(SignUpValidateEvent());
  }

  Future<void> _submitted(
      SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
    if (state.password != state.rePassword) {
      emit(SignUpErrorState(
        "비밀번호가 일치하지 않습니다",
        email: state.email,
        password: state.password,
        rePassword: state.rePassword,
      ));
    } else {
      emit(SignUpLoadingState(
          email: state.email,
          password: state.password,
          rePassword: state.rePassword));
      Map<String?, UserModel?> result = await AuthRepository.instance
          .signUpWithEmailAndPassword(
              email: state.email!, password: state.password!);
      String? errorMessage = result.entries.first.key;
      UserModel? user = result.entries.first.value;
      if (user != null && errorMessage == null) {
        emit(SignUpSuccessState(user));
      } else {
        emit(SignUpErrorState(
          errorMessage,
          email: state.email,
          password: state.password,
          rePassword: state.rePassword,
        ));
      }
    }
  }
}
