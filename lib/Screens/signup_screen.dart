import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/complete_your_profile.dart';
import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agreeToTerms = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  // Variables to store user input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Loading state
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF6FA4B2),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            signUpTopImage(context),
            signUpForm(context),
          ],
        ),
      ),
    );
  }

  Widget signUpTopImage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 6 * defaultPadding),
        SizedBox(height: 20),
        Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF17405e),
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: Color.fromRGBO(0, 0, 0, 0.45),
                offset: Offset(3, 5),
                blurRadius: 7,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget signUpForm(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          _buildTextField(
            label: "Name",
            icon: Icons.person_outline,
            controller: _nameController,
          ),
          _buildTextField(
            label: "Email",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          _buildPasswordField(
            label: "Password",
            icon: Icons.lock_outline,
            isObscured: !showPassword,
            controller: _passwordController,
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
            controller: _confirmPasswordController,
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
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF123f68),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
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
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
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
    required TextEditingController controller,
    required VoidCallback toggleVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
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

  // Submit Form
  void _submitForm() {
    // Validate the form
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
        ),
      );
      return;
    }

    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the terms and conditions.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Simulate a delay for loading
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      // Navigate to the next page after successful form validation
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CompleteProfilePage(),
        ),
      );
    });
  }
}