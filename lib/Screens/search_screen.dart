import 'package:flutter/material.dart';

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

  // Map to define which restaurant should be removed for each disease
  final Map<String, String> diseaseToRestaurantMap = {
    "Blood Pressure": "Andrea",
    "Diabates": "Porta D'oro",
    "Allergies": "Bonsai",
  };

  // Getter for filtered items
  List<Map<String, String>> get filteredItems {
    if (selectedDisease == "None" || selectedDisease == null) {
      // If "None" is selected, display all restaurants
      return List.from(allItems);
    } else {
      // If a disease is selected, remove the corresponding restaurant
      final restaurantToRemove = diseaseToRestaurantMap[selectedDisease];
      return allItems.where((item) => item["title"] != restaurantToRemove).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
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

            // Main content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
          ],
        ),
      ),
    );
  }
}