import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/Signup/components/sign_up_top_image.dart';
import 'package:mate7tarsh/Screens/Signup/components/signup_form.dart';
// import 'components/sign_up_top_image.dart';
// import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            SignUpTopImage(),
            SignUpForm(), // Ensure this widget exists and is styled properly
          ],
        ),
      ),
    );
  }
}