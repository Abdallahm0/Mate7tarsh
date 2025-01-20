import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/favorite_screen.dart';
import 'package:mate7tarsh/Screens/home_screen.dart';
import 'package:mate7tarsh/Screens/profile_screen.dart';
import 'package:mate7tarsh/Screens/search_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  Color appBarBackgroundColor = Colors.transparent;

  final List<Widget> _screens = [
    HomeScreenPage(),
    SearchScreenPage(),
    FavoriteScreenPage(),
    ProfileScreenPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 60, // Adjust height as needed
        color: Color(0xFF6FA4B2), // Background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Center icons
          children: [
            _buildNavItem(Icons.home, 0),
            _buildNavItem(Icons.thumb_up, 1),
            _buildNavItem(Icons.favorite_border_outlined, 2),
            _buildNavItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  // Helper method to build navigation items
  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          if (index == 3) {
            appBarBackgroundColor = Color(0xFF6FA4B2);
          } else {
            appBarBackgroundColor = Colors.transparent;
          }
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? Colors.white : Colors.black, // Selected color
            size: 25, // Adjust icon size
          ),
        ],
      ),
    );
  }
}