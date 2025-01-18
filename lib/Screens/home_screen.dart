import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate7tarsh/Components/food_widget.dart';
import 'package:mate7tarsh/model/controller.dart';
import 'package:mate7tarsh/Screens/restaurant.dart'; // Import RestaurantScreen

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final controller = Get.put(FoodController()); // Initialize the controller
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> advertisementImages = [
    "assets/offer.png",
    "assets/offer2.png",
    "assets/offer3.png",
    "assets/offer4.png",
    "assets/offer5.png",
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
                        decoration: InputDecoration(
                          hintText: "What Are You Looking For?",
                          suffixIcon: const Icon(Icons.search, color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 28),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
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
                      children: List.generate(advertisementImages.length, (index) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.blue : Colors.grey,
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
                    "Lunch Near You",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
                    return Obx(() {
                      return FoodWidget(
                        img: item.img,
                        name: item.name,
                        cuisineType: item.cuisineType,
                        isFavorite: controller.isFavoriteLunch(item),
                        onFavoritePressed: () => controller.toggleFavoriteLunch(item),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantScreen(
                                restaurantName: item.name,
                                restaurantImage: item.img,
                                cuisineType: item.cuisineType,
                                location: item.location,
                              ),
                            ),
                          );
                        },
                        rating: item.rating,
                      );
                    });
                  },
                ),
              ),
            ),

            // Section header for Breakfast
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Breakfast Near You",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Breakfast options
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
                    return Obx(() {
                      return FoodWidget(
                        img: item.img,
                        name: item.name,
                        cuisineType: item.cuisineType,
                        isFavorite: controller.isFavoriteBreakfast(item),
                        onFavoritePressed: () => controller.toggleFavoriteBreakfast(item),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantScreen(
                                restaurantName: item.name,
                                restaurantImage: item.img,
                                cuisineType: item.cuisineType,
                                location: item.location,
                              ),
                            ),
                          );
                        },
                        rating: item.rating,
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
