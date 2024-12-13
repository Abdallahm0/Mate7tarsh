import 'package:flutter/material.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Add a background color here
      backgroundColor: const Color(0xFF6FA4B2), // Replace with your desired blue color
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              LoginScreenTopImage(),
              LoginForm(), // Ensure this widget exists and is styled properly
            ],
          ),
      ),
    );
  }
}
