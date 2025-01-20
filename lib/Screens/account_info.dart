import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool _isChecked = true; // State for the checkbox
  String? _selectedGender; // State for the selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Account info",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Change name
            buildOptionRow(context, "Change name", onTap: () {
              _showEditDialog(context, "Change Name", "Enter your new name");
            }),
            const Divider(height: 1, thickness: 1, color: Colors.black26),

            // Change password
            buildOptionRow(context, "Change password", onTap: () {
              _showEditDialog(context, "Change Password", "Enter your new password");
            }),
            const Divider(height: 1, thickness: 1, color: Colors.black26),

            // Date of birth
            buildOptionRow(context, "Date of birth (optional)", onTap: () {
              _showDatePicker(context);
            }),
            const Divider(height: 1, thickness: 1, color: Colors.black26),

            const SizedBox(height: 16),

            // Gender selection
            const Text(
              "Gender (optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                      value: "Male",
                      groupValue: _selectedGender, // Use state variable
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as String?; // Update state
                        });
                      },
                    ),
                    const Text("Male"),
                  ],
                ),
                const SizedBox(width: 16),
                Row(
                  children: [
                    Radio(
                      value: "Female",
                      groupValue: _selectedGender, // Use state variable
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value as String?; // Update state
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Checkbox for offers and discounts
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isChecked = !_isChecked; // Toggle checkbox state
                    });
                  },
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false; // Update checkbox state
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Yes, I want to receive offers and discounts",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Delete account button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  // Handle delete account logic
                },
                child: const Text(
                  "Delete account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a clickable option row
  Widget buildOptionRow(BuildContext context, String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Method to show an edit dialog
  void _showEditDialog(BuildContext context, String title, String hintText) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView( // Add SingleChildScrollView
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.4, // Set max height
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: hintText),
                  ),
                  const SizedBox(height: 16), // Add spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      const SizedBox(width: 8), // Add spacing
                      TextButton(
                        onPressed: () {
                          // Handle save logic here
                          Navigator.pop(context);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to show a date picker
  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        // Handle selected date logic here
      }
    });
  }
}