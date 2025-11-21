class UserModel {
  String name;
  String uid;
  String email;
  String role;

  UserModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.role,
  });

  //From database
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      uid: json['uid'],
      role: json['role'],
    );
  }

  //Into the database
  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'uid': uid, 'role': role};
  }
}
