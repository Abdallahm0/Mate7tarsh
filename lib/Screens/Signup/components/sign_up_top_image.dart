import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpTopImage extends StatelessWidget {
  const SignUpTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6 * defaultPadding),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            "Complete Your Profile",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF17405e),
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset(1, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}