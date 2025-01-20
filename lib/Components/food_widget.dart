import 'package:flutter/material.dart';


class FoodWidget extends StatelessWidget {
  final String img;
  final String name;
  final String description; // Use description for home page
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;
  final double rating;

  const FoodWidget({
    Key? key,
    required this.img,
    required this.name,
    required this.description, // Use description
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onTap,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 150, // Fixed width for all containers
          height: 200, // Fixed height for all containers
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 90,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Restaurant name and favorite icon in a Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 25,
                          ),
                          onPressed: onFavoritePressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    // Display description in the home screen
                    Text(
                      description, // Use description
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 1),
                    // Stars aligned to the right
                    Align(
                      alignment: Alignment.centerRight, // Align stars to the right
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Minimize row width
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < rating
                                ? const Color(0xFFFF7972) // Star color
                                : Colors.grey, // Grey for unselected stars
                            size: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}