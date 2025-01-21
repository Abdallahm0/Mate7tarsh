import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/landing_page.dart';
import '../constants.dart';
import 'signup_screen.dart';
import 'already_have_an_account_acheck.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            topImage(),
            loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget topImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 3 * defaultPadding),
        ClipRRect(
          child: Image.asset(
            "assets/small-logo.jpg",
            width: 180,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(height: 24),
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
        const SizedBox(height: 24),
      ],
    );
  }

  Widget loginForm(BuildContext context) {
    return Form(
      key: _formKey, // Assign the form key
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
            child: TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: "Email",
                hintStyle: TextStyle(color: Color(0xFF25507a)),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.person_2_outlined),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Color(0xFF25507a)),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF123F68),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
            onPressed: _isLoading ? null : _submitForm,
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    "Login".toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Submit Form
  void _submitForm() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show loading indicator
      });

      // Simulate a delay for loading
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false; // Hide loading indicator
        });

        // Navigate to the landing page after successful validation
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(),
          ),
        );
      });
    }
  }
}
