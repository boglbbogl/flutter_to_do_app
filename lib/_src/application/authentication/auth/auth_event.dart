import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AuthCheckEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignInWithEmailAndPassword extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignInWithGoogle extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}
