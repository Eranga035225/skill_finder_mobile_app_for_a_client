import 'package:flutter/material.dart';
import 'package:skill_finder/controllers/user_controller.dart';
import 'package:skill_finder/models/user_model.dart';
import 'package:skill_finder/screens/home_screen.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  void setUserModel(UserModel userModel) {
    _user = userModel;
    notifyListeners();
  }

  Future<void> fetchUserData(BuildContext context) async {
    final userModel = await UserController().fetchUserData();
    if (userModel != null) {
      _user = userModel;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
}
