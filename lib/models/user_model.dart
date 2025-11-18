class UserModel {
  String name;
  String uid;
  String email;

  UserModel({required this.email, required this.name, required this.uid});

  //From database
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      uid: json['uid'],
    );
  }

  //Into the database
  Map<String, dynamic> toJson() {
    return {'email': email, 'name': name, 'uid': uid};
  }
}
