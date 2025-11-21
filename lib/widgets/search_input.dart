import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final void Function(String) handleSearch;
  const SearchInput({super.key, required this.handleSearch});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2.0, color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    );

    return Column(
      spacing: 16,
      children: [
        TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Enter city name",
            prefixIcon: const Icon(Icons.search),

            enabledBorder: border,
            focusedBorder: border,
          ),
          onFieldSubmitted: (value) {
            handleSearch(value);
          },
        ),
        ElevatedButton(
          onPressed: () {
            handleSearch(searchController.text);
          },
          child: const Text(
            'Search',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
