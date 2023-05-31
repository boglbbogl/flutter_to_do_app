import 'package:equatable/equatable.dart';
import 'package:flutter_to_do/_src/model/user/user_model.dart';

abstract class AuthState extends Equatable {
  final UserModel? user;

  const AuthState({
    this.user,
  });
}

class AuthCheckState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSignInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthUserState extends AuthState {
  const AuthUserState({super.user});
  @override
  List<Object?> get props => [user];
}

class AuthUnUserState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthFailureState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  @override
  List<Object?> get props => [];
}
