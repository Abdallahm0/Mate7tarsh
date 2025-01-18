import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final String restaurantName;
  final String restaurantImage;
  final String cuisineType;
  final String location;

  const RestaurantScreen({
    Key? key,
    required this.restaurantName,
    required this.restaurantImage,
    required this.cuisineType,
    required this.location,
  }) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isFavorite = false;
  bool showReviews = false;
  List<Map<String, dynamic>> reviews = []; // List to store reviews
  bool isReviewPopupVisible = false; // Track if the review popup is visible

  // Function to show the review popup
  void _showReviewPopup() {
    setState(() {
      isReviewPopupVisible = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ReviewPopup(
          onReviewSubmitted: (String review, int rating) {
            setState(() {
              reviews.add({
                'name': 'You', // Replace with the user's name
                'date': 'Just now', // Replace with the current date
                'rating': rating,
                'review': review,
              });
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
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
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
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 18, color: Colors.grey),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.location,
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
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
                                showReviews = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Menu', style: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showReviews = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text('Reviews', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                if (!showReviews) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  const SizedBox(height: 8),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: const EdgeInsets.all(16),
                    children: [
                      buildDishCard('Fillet Mignon', '820.73 EGP', 'assets/home.png'),
                      buildDishCard('Grilled Chicken', '410.38 EGP', 'assets/grilled.png'),
                      buildDishCard('Smoked Salmon Bites', '254.98 EGP', 'assets/salmon.png'),
                      buildDishCard('Creamy Seafood Soup', '182.58 EGP', 'assets/soup.png'),
                      buildDishCard('Mix Green Salad', '113.98 EGP', 'assets/salad.png'),
                      buildDishCard('Cocktails', '82.58 EGP', 'assets/cocktail.png'),
                    ],
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
                          label: const Text('Write a Review', style: TextStyle(color: Colors.black)),
                        ),
                        const SizedBox(height: 16),
                        ...reviews.map((review) => buildReviewCard(
                              review['name'],
                              review['date'],
                              review['rating'],
                              review['review'],
                            )),
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
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

  Widget buildReviewCard(String name, String date, int rating, String review) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Text(name[0], style: const TextStyle(color: Colors.black)),
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: List.generate(
                  rating,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 16),
                ),
              ),
              const SizedBox(height: 4),
              Text(review),
            ],
          ),
          trailing: Text(date, style: const TextStyle(color: Colors.grey)),
        ),
        const Divider(),
      ],
    );
  }
}

// Review Popup Widget
class ReviewPopup extends StatefulWidget {
  final Function(String review, int rating) onReviewSubmitted;

  const ReviewPopup({Key? key, required this.onReviewSubmitted}) : super(key: key);

  @override
  _ReviewPopupState createState() => _ReviewPopupState();
}

class _ReviewPopupState extends State<ReviewPopup> {
  int rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          TextField(
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
    );
  }
}