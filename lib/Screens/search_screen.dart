import 'dart:math' as math;
import 'package:flutter/material.dart';

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 144,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                  color: Color(0xFF6FA4B2),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(700,400),
                  )),
            ),

          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70), // Add spacing below the semicircle
                // Search Bar
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What Are You Looking For?",
                        suffixIcon: const Icon(Icons.search, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 28),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryBox("Breakfast"),
                    _buildCategoryBox("FastFood"),
                    _buildCategoryBox("Dinner"),
                    _buildCategoryBox("Lunch"),
                  ],
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String label) {
    return Flexible(
      child: SizedBox(
        height: 40,
        width: 80, // Fixed height for all boxes
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.teal;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: size.width,
    );
    canvas.drawArc(rect, math.pi, math.pi, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
