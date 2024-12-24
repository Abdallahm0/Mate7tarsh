import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mate7tarsh/Screens/landing_page.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FA4B2), // Background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Enter Verification Code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "A Verification code Has Been Sent to:\nEmail......",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                        enableInteractiveSelection: true,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white54,
                        cursorHeight: 32,
                        style: TextStyle(
                            background: null,
                            color: Colors.white,
                            fontSize: 32),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ]),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't get a verification code?",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Resend logic here
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Cancel logic here
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blue[900],
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 30,
                  //       vertical: 12,
                  //     ),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   child: const Text(
                  //     "Cancel",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Continue logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
