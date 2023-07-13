import 'package:equatable/equatable.dart';
import 'package:flutter_to_do/_src/model/user/user_model.dart';

abstract class AuthEvent extends Equatable {}

class AuthCheckEvent extends AuthEvent {
  final UserModel? userModel;

  AuthCheckEvent({this.userModel});
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
