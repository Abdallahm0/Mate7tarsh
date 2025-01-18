import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  final String img;
  final String name;
  final String cuisineType;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;
  final double rating;

  const FoodWidget({
    Key? key,
    required this.img,
    required this.name,
    required this.cuisineType,
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
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 20,
                          ),
                          onPressed: onFavoritePressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Text(
                      cuisineType,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 1),
                    Row(
                      children: [
                        // Rating stars (without numeric value)
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < rating ? Colors.amber : Colors.grey,
                            size: 18,
                          ),
                        ),
                      ],
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