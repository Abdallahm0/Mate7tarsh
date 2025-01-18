import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/landing_page.dart';
import '../constants.dart';
import 'signup_screen.dart';
import 'already_have_an_account_acheck.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Add a background color here
      backgroundColor:
          const Color(0xFF6FA4B2), // Replace with your desired blue color
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topImage(),
            loginForm(
                context), // Ensure this widget exists and is styled properly
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

  Widget loginForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Username",
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
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
            child: TextFormField(
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
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: GestureDetector(
                onTap: () {
                  //to add forget password screen here (
                  //igate to a forget password screen)
                },
                child: Text("Forgot Password?"),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF123F68),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // Optional rounded corners
              ),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPage(),
                ),
              );
            },
            child: Text(
              "Login".toUpperCase(),
              style: TextStyle(color: Colors.white), // Button text color
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
}
