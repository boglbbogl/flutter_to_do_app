import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static final AuthRepository instance = AuthRepository._internal();
  factory AuthRepository() => instance;
  AuthRepository._internal();

  User? authCheck() {
    User? _user = FirebaseAuth.instance.currentUser;
    return _user;
  }
}
