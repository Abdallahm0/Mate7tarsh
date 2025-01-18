import 'dart:math' as math;
import 'package:flutter/material.dart';

class FavoriteScreenPage extends StatelessWidget {
  const FavoriteScreenPage({super.key});

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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16), // Adjust spacing as needed
                  const Text(
                    "What Would You Like To Eat?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Updated Search Box
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Dish Name",
                          suffixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 50,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          fillColor: Colors.grey[400],
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryIcon(Icons.fastfood, "All"),
                      _buildCategoryIcon(Icons.ramen_dining, "Chinese"),
                      _buildCategoryIcon(Icons.set_meal, "Seafood"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Your Favorite Restaurants",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // Add restaurant cards here if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.teal.shade100,
          child: Icon(icon, size: 30, color: Colors.teal),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xFF6FA4B2);
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
