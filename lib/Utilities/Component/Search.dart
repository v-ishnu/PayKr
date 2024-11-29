import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 20),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search Transactions',
          hintStyle: GoogleFonts.inter(
            color: const Color(0xff97969E),
            fontSize: 15
          ),
          prefixIcon: const Icon(
              HugeIcons.strokeRoundedSearch01,
              color: Color(0xff487ba4)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.white), // Set border color to white
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
        ),
        onChanged: (value) {
          // Implement your search logic here
          print('Searching for: $value');
        },
      ),
    );
  }
}
