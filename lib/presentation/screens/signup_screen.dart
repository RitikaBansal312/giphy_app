import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/utils/app_constant.dart';
import '../controllers/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.signup_msg,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 20, 63, 99)),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Your email',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Your password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                Container(
                  height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 20, 63, 99),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        authController.signUp(
                            emailController.text, passwordController.text);
                      }
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Color.fromARGB(255, 20, 63, 99)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
