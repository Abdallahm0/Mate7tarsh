import 'package:flutter/material.dart';

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      labelText: "searchscreen",
    ));
  }
}
