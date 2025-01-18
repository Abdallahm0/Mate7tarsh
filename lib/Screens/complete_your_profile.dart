import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/landing_page.dart';

class CompleteProfilePage extends StatelessWidget {
  const CompleteProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FA4B2),
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 140,
          margin: EdgeInsets.only(right: 250),
          child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
          decoration: BoxDecoration(
              color: Color(0xFF113F67),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(500),
              )),
        ),
        const Text(
                    "Hi,....",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        

        Padding(
         padding: const EdgeInsets.only(top: 50.0), 
           child: const Text(
            "PLEASE COMPLETE YOUR PROFILE TO ENJOY YOUR FOOD",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF113F67),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 50),
        // Age Input
        _buildCenteredInputField("Age"),
        const SizedBox(height: 20),
        // Number Input
        _buildCenteredInputField("Number"),
        const SizedBox(height: 20),
        // Favorite Food Dropdown
        _buildCenteredDropdownField("Favorite food", [
          "Pizza",
          "Burger",
          "Pasta",
          "Seafood",
          "Sushi",
        ]),
        const SizedBox(height: 20),
        // Diseases Dropdown
        _buildCenteredDropdownField("Diseases", [
          "Blood Pressure",
          "Stroke",
          "Heart Disease",
        ]),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Add form submission logic here
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF123f68), // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text(
              "Finish sign up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    )));
  }

  // Input Field with Centered Text
 Widget _buildCenteredInputField(String hintText) {
  return Container(
    width: 300, // Set the width of the box
    child: TextField(
      textAlign: TextAlign.start, // Align text to start
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 14, // Reduce font size // Reduce font size
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0, // Adjust vertical padding
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      )
      ),
    );
  }

  // Dropdown Field with Centered Text
  Widget _buildCenteredDropdownField(String hintText, List<String> options) {
  return Container(
    width: 300, // Set a smaller width for the dropdown box
    child: DropdownButtonFormField<String>(
      isExpanded: false, // Prevent dropdown from expanding unnecessarily
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0, // Reduce vertical padding
          horizontal: 16.0, // Optional: Reduce horizontal padding
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Center(
        child: Text(
          hintText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Center(
            child: Text(
              option,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {},
    )
    );
  }
}

  class SemiCirclePainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
      final paint = Paint()..color = Colors.indigo;
      final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height),
        radius: size.width,
      );
      canvas.drawArc(rect, math.pi, math.pi, true, paint);
    }

    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return false;
    }
  }
