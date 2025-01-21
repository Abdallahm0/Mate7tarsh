import 'package:flutter/material.dart';
import 'dart:math';

class SearchScreenPage extends StatelessWidget {
  final String? selectedDisease;

  SearchScreenPage({Key? key, this.selectedDisease}) : super(key: key);

  // Sample data for images and descriptions
  final List<Map<String, String>> allItems = [
    {
      "image": "assets/Bonsai.jpg",
      "title": "Bonsai",
      "disease": "None",
    },
    {
      "image": "assets/porta doro.jpg",
      "title": "Porta D'oro",
      "disease": "None",
    },
    {
      "image": "assets/blue restaurant.jpg",
      "title": "The Blue Restaurant",
      "disease": "Blood Pressure",
    },
    {
      "image": "assets/saigon.jpg",
      "title": "Saigon Restaurant",
      "disease": "Diabetes",
    },
    {
      "image": "assets/revoloving.jpg",
      "title": "Revolving Restaurant",
      "disease": "Allergies",
    },
    {
      "image": "assets/andrea.jpg",
      "title": "Andrea",
      "disease": "None",
    },
  ];

  // Function to filter restaurants and remove one random restaurant
  List<Map<String, String>> getFilteredItems(String? disease) {
    List<Map<String, String>> filteredList;

    // Show all restaurants if "None" is selected
    if (disease == "None" || disease == null) {
      return List.from(allItems); // Return all restaurants
    }

    // Filter restaurants that do not match the selected disease
    filteredList = allItems.where((item) => item["disease"] != disease).toList();

    // If the filtered list has more than one restaurant, remove one at random
    if (filteredList.length > 1) {
      final randomIndex = Random().nextInt(filteredList.length);
      filteredList.removeAt(randomIndex);
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    // Get the filtered list of restaurants
    final filteredItems = getFilteredItems(selectedDisease);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top curved container
            Container(
              height: 144,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: const Color(0xFF6FA4B2),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.elliptical(700, 400),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Recommendations For You",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Grid of containers
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          item["image"]!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
