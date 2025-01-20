import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RestaurantScreen(
        restaurantName: 'Restaurant 1',
        restaurantImage: 'assets/restaurant1.png',
        cuisineType: 'French Cuisine',
        location: 'Cairo, Egypt',
        menu: restaurant1Menu, // Pass specific menu here
      ),
    );
  }
}

// Example menu data for Restaurant 1
List<Dish> restaurant1Menu = [
  Dish(name: 'Fillet Mignon', price: '820.73 EGP', imagePath: 'assets/home.png', description: ''),
  Dish(name: 'Grilled Chicken', price: '410.38 EGP', imagePath: 'assets/grilled.png', description: ''),
  Dish(name: 'Smoked Salmon Bites', price: '254.98 EGP', imagePath: 'assets/salmon.png', description: ''),
  Dish(name: 'Creamy Seafood Soup', price: '182.58 EGP', imagePath: 'assets/soup.png', description: ''),
  Dish(name: 'Mix Green Salad', price: '113.98 EGP', imagePath: 'assets/salad.png', description: ''),
  Dish(name: 'Cocktails', price: '82.58 EGP', imagePath: 'assets/cocktail.png', description: ''),
];

// Example menu data for Restaurant 2
List<Dish> restaurant2Menu = [
  Dish(name: 'Pizza Margherita', price: '250.00 EGP', imagePath: 'assets/pizza.png', description: ''),
  Dish(name: 'Lasagna', price: '150.00 EGP', imagePath: 'assets/lasagna.png', description: ''),
  Dish(name: 'Spaghetti', price: '120.00 EGP', imagePath: 'assets/spaghetti.png', description: ''),
  Dish(name: 'Fried Chicken', price: '180.00 EGP', imagePath: 'assets/chicken.png', description: ''),
  Dish(name: 'Caesar Salad', price: '90.00 EGP', imagePath: 'assets/caesar_salad.png', description: ''),
  Dish(name: 'Red Wine', price: '200.00 EGP', imagePath: 'assets/red_wine.png', description: ''),
];

List<Dish> restaurant3Menu = [
  Dish(name: 'Pizza Margherita', price: '250.00 EGP', imagePath: 'assets/pizza.png', description: ''),
  Dish(name: 'Lasagna', price: '150.00 EGP', imagePath: 'assets/lasagna.png', description: ''),
  Dish(name: 'Spaghetti', price: '120.00 EGP', imagePath: 'assets/spaghetti.png', description: ''),
  Dish(name: 'Fried Chicken', price: '180.00 EGP', imagePath: 'assets/chicken.png', description: ''),
  Dish(name: 'Caesar Salad', price: '90.00 EGP', imagePath: 'assets/caesar_salad.png', description: ''),
  Dish(name: 'Red Wine', price: '200.00 EGP', imagePath: 'assets/red_wine.png', description: ''),
];

class RestaurantScreen extends StatefulWidget {
  final String restaurantName;
  final String restaurantImage;
  final String cuisineType;
  final String location;
  final List<Dish> menu;

  const RestaurantScreen({
    Key? key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.cuisineType,
    required this.location,
    required this.menu,
  }) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isFavorite = false;
  bool showReviews = false;
  bool showMenu = true;

  bool isReviewPopupVisible = false;

  // Function to show the review popup
  void _showReviewPopup() {
    setState(() {
      isReviewPopupVisible = true;
    });

    showModalBottomSheet(
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReviewPopup(
          onReviewSubmitted: (String review, int rating) {
            setState(() {
              isReviewPopupVisible = false;
            });
          },
        );
      },
    ).whenComplete(() {
      setState(() {
        isReviewPopupVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.restaurantImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.restaurantName,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 1),
                      Text(
                        widget.cuisineType,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 18, color: Colors.grey),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.location,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showMenu = true;
                                showReviews = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Menu',
                                style: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showReviews = true;
                                showMenu = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Reviews',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                if (showMenu) ...[
                  // Show menu when 'Menu' button is clicked
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.all(16),
                    children: widget.menu.map((dish) {
                      return buildDishCard(dish.name, dish.price, dish.imagePath);
                    }).toList(),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _showReviewPopup,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          icon: const Icon(Icons.edit, color: Colors.black),
                          label: const Text('Write a Review',
                              style: TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDishCard(String name, String price, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imagePath,
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dish {
  final String name;
  final String price;
  final String imagePath;

  Dish({required this.name, required this.price, required this.imagePath, required String description});
}

// Review Popup Widget
class ReviewPopup extends StatefulWidget {
  final Function(String review, int rating) onReviewSubmitted;

  const ReviewPopup({Key? key, required this.onReviewSubmitted})
      : super(key: key);

  @override
  _ReviewPopupState createState() => _ReviewPopupState();
}

class _ReviewPopupState extends State<ReviewPopup> {
  int rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Write a Review',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    widget.onReviewSubmitted(_reviewController.text, rating);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reviewController,
              decoration: const InputDecoration(
                hintText: 'Write your review here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < rating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onReviewSubmitted(_reviewController.text, rating);
                Navigator.pop(context);
              },
              child: const Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
