// ignore_for_file: prefer_const_constructors

import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/services/controller/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/components/text_field.dart';


class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwConfirmController = TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  void register(BuildContext context) async {
    final authService = AuthService();
    if (_pwConfirmController.text == _pwController.text) {
      try {
        await authService.registerWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text("Passwords Don't match")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.message,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                // Welcome Back Message
                Text("Welcome Back!"),
                // Email pass textfield
                const SizedBox(
                  height: 25,
                ),
                textField(
                  hintText: "Input Email",
                  obscureText: false,
                  controller: _emailController,

                ),

                const SizedBox(height: 25),
                textField(
                  hintText: "Input Password",
                  obscureText: true,
                  controller: _pwController,

                ),

                const SizedBox(height: 25),
                textField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: _pwConfirmController,

                ),

                // Go to Register Page
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: "Register",
                  onTap: () => register(context),
                ),

                const SizedBox(
                  height: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
