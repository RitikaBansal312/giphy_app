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
      // appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConstants.signup_msg,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 20, 63, 99)),
                  ),
                ],
              ),
              SizedBox(height: 50),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Your email',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email address";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
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
              SizedBox(height: 50),
              Container(
                height: 30,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 20, 63, 99),
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
              SizedBox(height: 20),
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
    );
  }
}
