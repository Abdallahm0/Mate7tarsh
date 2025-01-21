import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate7tarsh/Components/food_widget.dart';
import 'package:mate7tarsh/model/controller.dart';
import 'package:mate7tarsh/Screens/restaurant.dart'; // Import RestaurantScreen
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'package:mate7tarsh/model/test_modle.dart';
import 'package:mate7tarsh/services/location_service.dart'; // Import LocationService

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final FoodController controller =
      Get.put(FoodController()); // Initialize the controller
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final LocationService _locationService =
      LocationService(); // Initialize LocationService
  String locationText = "Fetching location..."; // Default location text

  // Controller for the search bar
  final TextEditingController _searchController = TextEditingController();

  final List<String> advertisementImages = [
    "assets/offer.png",
    "assets/offer5.jpg",
    "assets/offer2.png",
    "assets/offer3.png",
    "assets/offer4.png",
  ];

  // Fetch location when the button is pressed
  Future<void> fetchLocation() async {
    try {
      // Request location permissions
      await _locationService.requestLocationPermission();

      // Fetch the current location
      Position position = await _locationService.getCurrentLocation();

      // Update the UI with the fetched location
      setState(() {
        locationText = "Lat: ${position.latitude}, Long: ${position.longitude}";
      });

      // Show the location in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Location: ${position.latitude}, ${position.longitude}"),
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Handle errors (e.g., permissions denied, location services disabled)
      setState(() {
        locationText = "Error: $e";
      });

      // Show the error in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // Function to handle search
  // Function to handle search
void _handleSearch() {
  final String query = _searchController.text.trim();

  if (query.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a restaurant name.'),
      ),
    );
    return;
  }

  // Find the restaurant in the list
  TestModle? restaurant;
  try {
    restaurant = controller.lunchList.firstWhere(
      (restaurant) => restaurant.name.toLowerCase() == query.toLowerCase(),
    );
  } catch (e) {
    // If not found in lunchList, search in breakfastList
    try {
      restaurant = controller.breakfastList.firstWhere(
        (restaurant) => restaurant.name.toLowerCase() == query.toLowerCase(),
      );
    } catch (e) {
      // If still not found, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Restaurant not found.'),
        ),
      );
      return;
    }
  }

  // Define or fetch the menu for the restaurant
  List<Dish> menu = [
    Dish(
        name: "Fillet mignon",
        description: "Delicious dish 1",
        price: "820.73 EGP",
        imagePath: 'assets/home.png'),
    Dish(
        name: "Grilled Chicken",
        description: "Grilled Chicken",
        price: "410.38 EGP",
        imagePath: 'assets/grilled.png'),
    Dish(
        name: "Smoked Salmon Bites",
        description: "Delicious dish 1",
        price: "284.81",
        imagePath: 'assets/salmon.png'),
    Dish(
        name: "Creamy Seafood Soup",
        description: "Delicious dish 1",
        price: "182.38",
        imagePath: 'assets/Seafood.png'),
    Dish(
        name: "Mix Green Salad",
        description: "Delicious dish 1",
        price: "150.70",
        imagePath: 'assets/home.png'),
    Dish(
        name: "Cocktails",
        description: "Delicious dish 1",
        price: "139.70",
        imagePath: 'assets/salad.png'),
  ];

  // Navigate to the restaurant page
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RestaurantScreen(
        restaurantName: restaurant!.name,
        restaurantImage: restaurant.img,
        cuisineType: restaurant.cuisineType,
        location: restaurant.location,
        menu: menu, // Pass the menu here
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
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
                const SizedBox(height: 10),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: "What Are You Looking For?",
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search,
                                    color: Colors.black),
                                onPressed: _handleSearch,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 28),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                              ),
                              fillColor: Colors.grey[300],
                              filled: true,
                            ),
                            onSubmitted: (value) {
                              _handleSearch();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Advertisement section
                SizedBox(
                  height: 170,
                  width: 360,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: advertisementImages.map((image) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(22),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(image),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(advertisementImages.length,
                              (index) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),

                // Section header for Lunch
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Restaurant Near You",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Removed the "See All" button
                    ],
                  ),
                ),

                // Lunch options
                SizedBox(
                  height: 230, // Fixed height for the container
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                      itemExtent: 170, // Fixed width for each item
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.lunchList.length,
                      itemBuilder: (context, i) {
                        final item = controller.lunchList[i];
                        return FoodWidget(
                          img: item.img,
                          name: item.name,
                          description: item
                              .description, // Use description for home screen
                          isFavorite: controller.isFavoriteLunch(item),
                          onFavoritePressed: () =>
                              controller.toggleFavoriteLunch(item),
                          onTap: () {
                            // Define or fetch the menu for the restaurant
                            List<Dish> menu = [
                              Dish(
                                  name: "Fillet mignon",
                                  description: "Delicious dish 1",
                                  price: "820.73 EGP",
                                  imagePath: 'assets/home.png'),
                              Dish(
                                  name: "Grilled Chicken",
                                  description: "Grilled Chicken",
                                  price: "410.38 EGP",
                                  imagePath: 'assets/grilled.png'),
                              Dish(
                                  name: "Smoked Salmon Bites",
                                  description: "Delicious dish 1",
                                  price: "284.81",
                                  imagePath: 'assets/salmon.png'),
                              Dish(
                                  name: "Creamy Seafood Soup",
                                  description: "Delicious dish 1",
                                  price: "182.38",
                                  imagePath: 'assets/Seafood.png'),
                              Dish(
                                  name: "Mix Green Salad",
                                  description: "Delicious dish 1",
                                  price: "150.70",
                                  imagePath: 'assets/home.png'),
                              Dish(
                                  name: "Cocktails",
                                  description: "Delicious dish 1",
                                  price: "139.70",
                                  imagePath: 'assets/salad.png'),
                            ];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantScreen(
                                  restaurantName: item.name,
                                  restaurantImage: item.img,
                                  cuisineType: item.cuisineType,
                                  location: item.location,
                                  menu: menu, // Pass the menu here
                                ),
                              ),
                            );
                          },
                          rating: item.rating,
                        );
                      },
                    ),
                  ),
                ),

                // Add space between the first and second sections
                const SizedBox(height: 40), // Increased space here

                // Breakfast options (without the "Breakfast Near You" text and "See All" button)
                SizedBox(
                  height: 230, // Fixed height for the container
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                      itemExtent: 170, // Fixed width for each item
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.breakfastList.length,
                      itemBuilder: (context, i) {
                        final item = controller.breakfastList[i];
                        return FoodWidget(
                          img: item.img,
                          name: item.name,
                          description: item
                              .description, // Use description for home screen
                          isFavorite: controller.isFavoriteBreakfast(item),
                          onFavoritePressed: () =>
                              controller.toggleFavoriteBreakfast(item),
                          onTap: () {
                            // Define or fetch the menu for the restaurant
                            List<Dish> menu = [
                              Dish(
                                  name: "Healthy breakfast",
                                  description: "Delicious dish 1",
                                  price: '120.0',
                                  imagePath: 'assets/break1.jpg'),
                              Dish(
                                  name: "Oriental breakfast",
                                  description: "Delicious dish 2",
                                  price: '140.0',
                                  imagePath: 'assets/break2.jpg'),
                                  Dish(
                                  name: "frensh breakfast",
                                  description: "Delicious dish 2",
                                  price: '160.0',
                                  imagePath: 'assets/break3.jpg'),
                                  Dish(
                                  name: "salad breakfast",
                                  description: "Delicious dish 2",
                                  price: '170.0',
                                  imagePath: 'assets/salad.png'),
                              // Add more dishes here
                            ];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantScreen(
                                  restaurantName: item.name,
                                  restaurantImage: item.img,
                                  cuisineType: item.cuisineType,
                                  location: item.location,
                                  menu: menu, // Pass the menu here
                                ),
                              ),
                            );
                          },
                          rating: item.rating,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Location button at the top-right corner
          Positioned(
            top: 40, // Adjust the top position as needed
            right: 16, // Adjust the right position as needed
            child: IconButton(
              icon: const Icon(Icons.location_on,
                  size: 30, color: Colors.blue), // Location icon
              onPressed: fetchLocation, // Call fetchLocation when pressed
            ),
          ),
        ],
      ),
    );
  }
}
