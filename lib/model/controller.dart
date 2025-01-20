import 'package:get/get.dart';
import 'package:mate7tarsh/model/test_modle.dart';

class FoodController extends GetxController {
  // Separate lists for Lunch and Breakfast
  final List<TestModle> lunchList = [
    TestModle(
      img: "assets/home.png",
      name: "Sizzler",
      cuisineType: "American cuisine",
      location: "3 Al Narges St, From Tharwa St, Dokki",
      description: "American, Steak, Grill, Chicken", // Add description
      rating: 4.5,
    ),
    TestModle(
      img: "assets/Portadoro.jpg",
      name: "Porta d'oro",
      cuisineType: "Italian cuisine",
      location: "123 Main St, New York",
      description: "Italian, Lasagna, Pizza, Rissitto", // Add description
      rating: 4.0,
    ),
    TestModle(
      img: "assets/grilled.png",
      name: "Labash",
      cuisineType: "  Egyptian cuisine",
      location: "456 Elm St, Los Angeles",
      description: "Grilled Chicken, Beef, Burger", // Add description
      rating: 4.2,
    ),
  ];

  final List<TestModle> breakfastList = [
    TestModle(
      img: "assets/image.png",
      name: "La Terrace",
      cuisineType: "Italian cuisine",
      location: "3 Al Narges St, From Tharwa St, Dokki",
      description: "Sandwitch, Salads, Cold Sandwiches", // Add description
      rating: 4.3,
    ),
    TestModle(
      img: "assets/image3.png",
      name: "Heaven",
      cuisineType: "American cuisine",
      location: "789 Oak St, Chicago",
      description: "Croissant, Coffe, Salads, sandwiches", // Add description
      rating: 4.1,
    ),
    TestModle(
      img: "assets/zooba.png",
      name: "Zooba",
      cuisineType: "Egyptian cuisine",
      location: "101 Pine St, San Francisco",
      description: "Traditional Egyptian breakfast", // Add description
      rating: 4.4,
    ),
  ];

  // Observable sets to store favorite items for Lunch and Breakfast
  final RxSet<TestModle> _favoriteLunch = <TestModle>{}.obs;
  final RxSet<TestModle> _favoriteBreakfast = <TestModle>{}.obs;

  // Check if an item is marked as favorite in Lunch
  bool isFavoriteLunch(TestModle item) {
    return _favoriteLunch.contains(item);
  }

  // Check if an item is marked as favorite in Breakfast
  bool isFavoriteBreakfast(TestModle item) {
    return _favoriteBreakfast.contains(item);
  }

  // Toggle favorite status for an item in Lunch
  void toggleFavoriteLunch(TestModle item) {
    if (isFavoriteLunch(item)) {
      _favoriteLunch.remove(item);
    } else {
      _favoriteLunch.add(item);
    }
  }

  // Toggle favorite status for an item in Breakfast
  void toggleFavoriteBreakfast(TestModle item) {
    if (isFavoriteBreakfast(item)) {
      _favoriteBreakfast.remove(item);
    } else {
      _favoriteBreakfast.add(item);
    }
  }

  // Get a list of favorite items for Lunch
  List<TestModle> get favoriteLunch => _favoriteLunch.toList();

  // Get a list of favorite items for Breakfast
  List<TestModle> get favoriteBreakfast => _favoriteBreakfast.toList();

  void toggleFavorite(TestModle restaurant, {required bool isLunch}) {}
}