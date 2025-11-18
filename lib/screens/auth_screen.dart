import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_finder/components/custom_button.dart';
import 'package:skill_finder/components/custom_text_field.dart';
import 'package:skill_finder/providers/auth_state_provider.dart';
import 'package:skill_finder/screens/categories_screen.dart';
import 'package:skill_finder/screens/service_provider_list.dart';
import 'package:skill_finder/utils/custom_colors.dart';

class AuthScreen extends StatefulWidget {
  final String authScreenType;

  const AuthScreen({super.key, this.authScreenType = 'signup'});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late String authScreenType;

  @override
  void initState() {
    super.initState();
    authScreenType = widget.authScreenType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          authScreenType == 'signup' ? 'Sign Up' : 'Sign In',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Consumer<AuthStateProvider>(
        builder: (context, authProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (authScreenType == 'signup')
                  CustomTextField(
                    label: 'Full Name',
                    controller: authProvider.nameController,
                  ),
                CustomTextField(
                  label: 'Email',
                  controller: authProvider.emailController,
                ),
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  controller: authProvider.passwordController,
                ),
                if (authScreenType == 'signup')
                  CustomTextField(
                    label: 'Confirm Password',
                    isPassword: true,
                    controller: authProvider.confirmPasswordController,
                  ),

                SizedBox(height: 16),
                CustomButton(
                  buttonColor: CustomColors.primaryColor,
                  text: authScreenType == 'signup'
                      ? 'Sign up'
                      : authScreenType == 'signin'
                      ? 'Sign in'
                      : 'Reset Password',
                  onTap: () {
                    setState(() {
                      if (authScreenType == 'signup') {
                        authProvider.signupUser(context);
                      } else if (authScreenType == 'signin') {
                        authProvider.signInUser(context);
                      }
                    });
                  },
                ),
                SizedBox(height: 16),
                if (authScreenType == 'signin')
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          authScreenType = 'signup';
                        });
                      },
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Color(0xFF618A8A),
                        ),
                      ),
                      child: Text("Don't have an account? Sign up"),
                    ),
                  ),
                if (authScreenType == 'signup')
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          authScreenType = 'signin';
                        });
                      },

                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(
                          Color(0xFF618A8A),
                        ),
                      ),
                      child: Text("Already have an account? Sign in"),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
