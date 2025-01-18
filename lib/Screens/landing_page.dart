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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6FA4B2),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 3) {
              appBarBackgroundColor = Color(0xFF6FA4B2);
            } else {
              appBarBackgroundColor = Colors.transparent;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}