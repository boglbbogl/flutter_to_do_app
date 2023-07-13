import 'package:equatable/equatable.dart';
import 'package:flutter_to_do/_src/model/user/user_model.dart';

abstract class SignUpState extends Equatable {
  final String? email;
  final String? password;
  final String? rePassword;

  const SignUpState({
    this.email,
    this.password,
    this.rePassword,
  });
}

class SignUpInitState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpInputState extends SignUpState {
  const SignUpInputState({super.email, super.password, super.rePassword});
  @override
  List<Object?> get props => [email, password, rePassword];
}

class SignUpSubmitState extends SignUpState {
  const SignUpSubmitState({super.email, super.password, super.rePassword});
  @override
  List<Object?> get props => [email, password, rePassword];
}

class SignUpErrorState extends SignUpState {
  final String? message;

  const SignUpErrorState(
    this.message, {
    super.email,
    super.password,
    super.rePassword,
  });

  @override
  List<Object?> get props => [message];
}

class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState({super.email, super.password, super.rePassword});
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends SignUpState {
  final UserModel userModel;

  const SignUpSuccessState(this.userModel);
  @override
  List<Object?> get props => [];
}
