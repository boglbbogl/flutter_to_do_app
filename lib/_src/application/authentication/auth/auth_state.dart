import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthCheckState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSignInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthUserState extends AuthState {
  @override
  List<Object?> get props => [];
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
