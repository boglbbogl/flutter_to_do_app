import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_to_do/_src/model/user/user_model.dart';

class AuthRepository {
  static final AuthRepository instance = AuthRepository._internal();
  factory AuthRepository() => instance;
  AuthRepository._internal();

  User? authCheck() {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }

  Future<Map<String?, UserModel?>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel user =
          UserModel(uid: credential.user!.uid, email: email, type: "email");
      return {null: user};
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "email-already-in-use":
          return {"이미 사용 중인 주소 입니다.": null};
        case "invalid-email":
          return {"이메일 형식이 맞지 않습니다": null};
        case "weak-password":
          return {"비밀번호는 6자리 이상이어야 합니다": null};
        case "operation-not-allowed":
          return {"잠시 후 다시 시도해 주세요": null};
        default:
          return {"잠시 후 다시 시도해 주세요": null};
      }
    }
  }
}
