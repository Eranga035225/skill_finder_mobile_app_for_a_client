import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';
import 'package:skill_finder/controllers/auth_controller.dart';
import 'package:skill_finder/controllers/user_controller.dart';
import 'package:skill_finder/models/user_model.dart';
import 'package:skill_finder/providers/user_provider.dart';
import 'package:skill_finder/screens/categories_screen.dart';
import 'package:skill_finder/screens/home_screen.dart';
import 'package:skill_finder/utils/custom_dialogs.dart';

class AuthStateProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  Future<void> signupUser(BuildContext context, String? role) async {
    if (_emailController.text.trim().length < 3) {
      CustomDialogs.showErrorSnackBar(context, 'Email is too short');
    } else if (_passwordController.text.trim().length < 6) {
      CustomDialogs.showErrorSnackBar(context, 'Password is too short');
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      CustomDialogs.showErrorSnackBar(
        context,
        'Password and Confirm Password do not match',
      );
    } else if (role == null || role.isEmpty) {
      CustomDialogs.showErrorSnackBar(context, 'Please select a role');
    } else {
      EasyLoading.show();
      final user = await AuthController().createUserAccount(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        role: role,
        context: context,
      );

      if (user != null) {
        final userModel = UserModel(
          email: _emailController.text.trim(),
          name: _nameController.text.trim(),
          uid: user.uid,
          role: role,
        );

        final isSuccess = await UserController().saveUserData(userModel);
        EasyLoading.dismiss();
        if (isSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      }
      Logger().i('User Created: ${user?.email}');
    }
  }

  Future<void> signInUser(BuildContext context) async {
    if (_emailController.text.trim().length < 3) {
      CustomDialogs.showErrorSnackBar(context, 'Email is too short');
      return;
    }

    if (_passwordController.text.trim().length < 6) {
      CustomDialogs.showErrorSnackBar(
        context,
        'Password should be at least 6 characters',
      );
      return;
    }

    EasyLoading.show();

    try {
      final user = await AuthController().signInUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );

      if (user == null) {
        Logger().w('signInUser: Firebase user is null');
        EasyLoading.dismiss();
        return;
      }

      // Try to fetch user data, but don't block navigation on it
      final userModel = await UserController().fetchUserData();
      Logger().i('Fetched userModel: $userModel');

      if (userModel != null && context.mounted) {
        Provider.of<UserProvider>(
          context,
          listen: false,
        ).setUserModel(userModel);
      }

      if (!context.mounted) return;

      // ✅ Always navigate after successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CategoriesScreen()),
      );
    } catch (e) {
      EasyLoading.showError('Sign in failed: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
}
