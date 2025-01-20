import 'package:flutter/material.dart';

class SearchScreenPage extends StatelessWidget {
  SearchScreenPage({Key? key})
      : super(key: key); // Use Key? key instead of super.key

  // Sample data for images and descriptions
  final List<Map<String, String>> items = [
    {
      "image": "assets/Bonsai.jpg",
      "title": "Bonsai",
    },
    {
      "image": "assets/porta doro.jpg",
      "title": "Porta D'oro",
    },
    {
      "image": "assets/food3.jpg",  
      "title": "The Blue Restaurant",
    },
    {
      "image": "assets/food4.jpg",
      "title": "Saigon Restaurant",
    },
    {
      "image": "assets/food5.jpg",
      "title": "Revolving Restaurant",
    },
    {
      "image": "assets/food6.jpg",
      "title": "Andrea",
    },
  ];

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
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 16, // Spacing between columns
                      mainAxisSpacing: 16, // Spacing between rows
                      childAspectRatio:
                          0.8, // Width to height ratio of each container
                    ),
                    itemCount: items.length, // Number of items
                    itemBuilder: (context, index) {
                      final item = items[index];
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
                                item[
                                    "image"]!, // Use the image path from the list
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
                                    item[
                                        "title"]!, // Use the title from the list
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Text(
                                  //   item[
                                  //       "description"]!, // Use the description from the list
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     color: Colors.grey[600],
                                  //   ),
                                  // ),
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
