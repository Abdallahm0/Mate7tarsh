import 'package:flutter/material.dart';
import '../../Verification/verification_page.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool agreeToTerms = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _buildTextField(label: "UserName", icon: Icons.person_outline),
          _buildTextField(
            label: "Email",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          _buildPasswordField(
            label: "Password",
            icon: Icons.lock_outline,
            isObscured: !showPassword,
            toggleVisibility: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ),
          _buildPasswordField(
            label: "Confirm Password",
            icon: Icons.lock_outline,
            isObscured: !showConfirmPassword,
            toggleVisibility: () {
              setState(() {
                showConfirmPassword = !showConfirmPassword;
              });
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: agreeToTerms,
                activeColor: Colors.teal,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms = value ?? false;
                  });
                },
              ),
              const Text(
                "Agree With ",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  // Add Terms & Conditions logic here
                },
                child: const Text(
                  "Terms And Conditions",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4c828e),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add form submission logic here
                // After Sign up API is called, navigate to Verification screen
                // TODO: Add sign up API call
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyAccountPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF123f68),
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Verify",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required IconData icon,
    required bool isObscured,
    required VoidCallback toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        obscureText: isObscured,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: toggleVisibility,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }
}
