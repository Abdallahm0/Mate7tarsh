import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mate7tarsh/controller/food_controller.dart';
import 'package:mate7tarsh/model/controller.dart';
import 'package:mate7tarsh/model/test_modle.dart';

class FavoriteScreenPage extends StatelessWidget {
  FavoriteScreenPage({super.key});

  final FoodController _foodController = Get.put(FoodController());

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
              decoration: const BoxDecoration(
                color: Color(0xFF6FA4B2),
                borderRadius: BorderRadius.only(
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
                  const SizedBox(height: 24),
                  const Text(
                    "Your Favorite Restaurants",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // List of favorite restaurant cards
                  Obx(() {
                    final favorites = _foodController.favoriteLunch +
                        _foodController.favoriteBreakfast;

                    if (favorites.isEmpty) {
                      return const Text(
                        "No favorite restaurants yet!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return _buildRestaurantCard(favorites[index]);
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build a restaurant card
  Widget _buildRestaurantCard(TestModle restaurant) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Restaurant image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                restaurant.img,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Restaurant details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.cuisineType,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                    Icons.star,
                   color: Color(0xFFFF7972), // Use the hex color code #FF7972
                   size: 16,
                   ),
                      const SizedBox(width: 4),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Favorite icon
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                // Toggle favorite status
                _foodController.toggleFavorite(
                  restaurant,
                  isLunch: _foodController.lunchList.contains(restaurant),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
