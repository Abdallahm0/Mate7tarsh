import 'package:flutter/material.dart';
import 'package:mate7tarsh/Screens/landing_page.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  // Variables to store user input
  int? age;
  String? favoritePlaces;
  String? favoriteFood;
  String? diseases;

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Loading state
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FA4B2),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                margin: const EdgeInsets.only(right: 250),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF113F67),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(500),
                        ),
                      ),
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
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
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
              _buildCenteredInputField("Age", onChanged: (value) {
                setState(() {
                  age = int.tryParse(value);
                });
              }),
              const SizedBox(height: 20),
              // Favorite Places Dropdown
              _buildCenteredDropdownField(
                "Favorite Places",
                ["Dokki", "Zayed", "Maadi"],
                onChanged: (value) {
                  setState(() {
                    favoritePlaces = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Favorite Food Dropdown
              _buildCenteredDropdownField(
                "Favorite Cuisine",
                ["Egyptian", "Italian", "American"],
                onChanged: (value) {
                  setState(() {
                    favoriteFood = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Diseases Dropdown
              _buildCenteredDropdownField(
                "Diseases",
                ["Dairy", "Sugar", "Allergies", "None"],
                onChanged: (value) {
                  setState(() {
                    diseases = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123f68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
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
          ),
        ),
      ),
    );
  }

  // Input Field with Centered Text
  Widget _buildCenteredInputField(String hintText,
      {ValueChanged<String>? onChanged}) {
    return Container(
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $hintText';
          }
          if (hintText == "Age" && int.tryParse(value) == null) {
            return 'Please enter a valid number for age';
          }
          return null;
        },
      ),
    );
  }

  // Dropdown Field with Centered Text
  Widget _buildCenteredDropdownField(
    String hintText,
    List<String> options, {
    ValueChanged<String?>? onChanged,
  }) {
    return Container(
      width: 300,
      child: DropdownButtonFormField<String>(
        isExpanded: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
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
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your $hintText';
          }
          return null;
        },
      ),
    );
  }

  // Submit Form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigate to the Landing Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    } else {
      // If the form is invalid, show a snackbar or error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields correctly.')),
      );
    }
  }
}
