import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final void Function()? onTap;
  void login(context) async {
    final authService = AuthService();
    try {
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        print("==========>Email Or Password is Incorrect!");
        return;
      }
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      print("Error===>$e");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(e.toString())),
      );
    }
  }

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
                "Welcome back you've been missing!",
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
              MyButton(label: "Login", onTap: () => login(context)),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Rigister now",
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
