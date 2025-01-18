import 'package:flutter/material.dart';

class EditMyProfile extends StatelessWidget {
  const EditMyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures the entire screen background is white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit My Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white, // Additional container for a white background
        child: ListView(
          children: [
            buildProfileOption(context, "Account info", "", Icons.arrow_forward_ios),
            buildProfileOption(context, "Location", "", Icons.arrow_forward_ios),
            buildProfileOption(context, "Change email", "", Icons.arrow_forward_ios),
            buildProfileOption(context, "Change password", "", Icons.arrow_forward_ios),
            buildProfileOption(context, "Notifications", "Enabled", Icons.arrow_forward_ios),
            buildProfileOption(
              context,
              "Language",
              "English",
              Icons.arrow_forward_ios,
              onTap: () => _showLanguageBottomSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(
    BuildContext context,
    String title,
    String trailingText,
    IconData trailingIcon, {
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText.isNotEmpty)
                Text(
                  trailingText,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              const SizedBox(width: 8),
              Icon(trailingIcon, size: 16, color: Colors.black54),
            ],
          ),
          onTap: onTap,
        ),
        const Divider(height: 1, thickness: 1, color: Colors.black12),
      ],
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          color: Colors.white, // Ensures the bottom sheet has a white background
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Language",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ListTile(
                title: const Text("English"),
                onTap: () {
                  // Handle selecting English
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("العربية"),
                onTap: () {
                  // Handle selecting Arabic
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
