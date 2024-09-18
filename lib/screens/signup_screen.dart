import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giphy_app/controllers/auth_controller.dart';
import 'package:giphy_app/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authController.signup(emailController.text, passwordController.text),
              child: const Text("Sign Up"),
            ),
            TextButton(
              onPressed: () => Get.to(() => LoginScreen()),
              child: const Text("Already have an account? Login"),
            )
          ],
        ),
      ),
    );
  }
}
