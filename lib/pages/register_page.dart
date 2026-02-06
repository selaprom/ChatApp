import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final void Function()? onTap;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void register() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 40),
              Text(
                "Let create an account for you",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextfield(
                  hintText: "Email",
                  obscureText: false,
                  controller: _emailController,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextfield(
                  hintText: "PassWord",
                  obscureText: true,
                  controller: _passwordController,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyTextfield(
                  hintText: "Conform PassWord",
                  obscureText: true,
                  controller: _confirmPasswordController,
                ),
              ),
              MyButton(label: "Register", onTap: register),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
