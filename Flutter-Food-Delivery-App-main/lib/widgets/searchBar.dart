import 'package:flutter/material.dart';


class CustomSearchBar extends StatelessWidget {
  final String title;

  const CustomSearchBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchBar(
        leading: const Icon(Icons.search),
        hintText: title,
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0),
        ),
        onTap: () {
          // Handle search tap
        },
        onChanged: (_) {
          // Handle search text change
        },
      ),
    );
  }
}
