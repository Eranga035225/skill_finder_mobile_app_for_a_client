import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/web.dart';
import 'package:skill_finder/models/user_model.dart';

class UserController {
  //User collection
  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<bool> saveUserData(UserModel user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
      Logger().i('User data saved');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      final data = await userCollection.doc(uid).get();
      if (data.data() != null) {
        final user = UserModel.fromJson(data.data()!);
        Logger().e(user.toJson());
        return user;
      }
      return null;
    } catch (e) {
      Logger().e(e);
      return null;
    }
  }
}
