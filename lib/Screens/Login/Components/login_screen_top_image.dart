import 'package:flutter/material.dart';

import '../../../constants.dart';
//import '../../Signup/signup_screen.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 3 * defaultPadding),
        // Reduce top spacing
        ClipRRect(
          child: Image.asset(
            "assets/small-logo.jpg",
            width: 180,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(height: 24), // Reduce spacing between logo and text
        const Text(
          "Welcome Back!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 3),
                  blurRadius: 8.0,
                  color: Color(0x66000000),
                )
              ]),
        ),
        const SizedBox(height: 24), // Adjust spacing between text and form
        // ... login form code here ...
      ],
    );
  }
}
