import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_event.dart';
import 'package:flutter_to_do/_src/application/authentication/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthCheckState()) {
    on<AuthCheckEvent>(_check);
    add(AuthCheckEvent());
    on<AuthSignInWithEmailAndPassword>(_signInWithEmailAndPassword);
    on<AuthSignInWithGoogle>(_signInWithGoogle);
    on<AuthSignOut>(_signOut);
  }

  Future<void> _check(AuthCheckEvent event, Emitter<AuthState> emit) async {}
  Future<void> _signInWithEmailAndPassword(
      AuthSignInWithEmailAndPassword event, Emitter<AuthState> emit) async {}
  Future<void> _signInWithGoogle(
      AuthSignInWithGoogle event, Emitter<AuthState> emit) async {}
  Future<void> _signOut(AuthSignOut event, Emitter<AuthState> emit) async {}
}
