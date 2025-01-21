import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreenPage extends StatefulWidget {
  final String? selectedDisease;

  SearchScreenPage({Key? key, this.selectedDisease}) : super(key: key);

  @override
  _SearchScreenPageState createState() => _SearchScreenPageState();
}

class _SearchScreenPageState extends State<SearchScreenPage> {
  List<Map<String, String>> allItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRestaurantData();
  }

  Future<void> fetchRestaurantData() async {
    final response = await http.get(Uri.parse(
        'https://iridescent-squirrel-993db4.netlify.app/.netlify/functions/main/recommend?userId=1'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        allItems = data
            .map((item) => {
                  "image": item["image"] as String,
                  "title": item["name"] as String,
                })
            .toList();
        isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: allItems.length,
                    itemBuilder: (context, index) {
                      final item = allItems[index];
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
                              child: Image.network(
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
    );
  }
}
