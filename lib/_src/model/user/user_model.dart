class UserModel {
  final String uid;
  final String email;
  final String type;

  UserModel({
    required this.uid,
    required this.email,
    required this.type,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     UserModel(uid: json["uid"], email: json["email"], type: json["type"]);

  // Map<String, dynamic> toJson() => {
  //       "uid": uid,
  //       "email": email,
  //       "type": type,
  //     };
}
