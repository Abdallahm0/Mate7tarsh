import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/edit_myprofile.dart';
import 'package:mate7tarsh/Screens/restaurant.dart'; // Remove if not needed

const textColor = Color(0xFF021B33);

class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top half with teal background
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFF6FA4B2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            iconSize: 70,
                            onPressed: () {
                              // TODO: Open image picker / Camera
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Joumana Tarek",
                          style: TextStyle(fontSize: 18, color: textColor),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "joumanatarek29@gmail.com",
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                // Notification button at the top-right
                Positioned(
                  top: 40, // Adjust the position as needed
                  right: 16, // Adjust the position as needed
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      // TODO: Handle notification button press
                    },
                  ),
                ),
              ],
            ),
          ),
          // Bottom half with white background
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    ProfileOption(
                      icon: Icons.percent_rounded,
                      title: "Promotions",
                      onTap: () {
                        // TODO: Handle promotions
                      },
                    ),
                    const Divider(),
                    ProfileOption(
                      icon: Icons.person,
                      title: "Edit My Profile",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditMyProfile(),
                          ),
                        );
                      },
                    ),
                    const Divider(),
                    ProfileOption(
                      icon: Icons.logout,
                      title: "Logout",
                      onTap: () {
                        // TODO: Handle logout functionality
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: textColor),
      onTap: onTap,
    );
  }
}