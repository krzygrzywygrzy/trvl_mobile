import 'package:flutter/material.dart';

import '../core/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightGray,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "search...",
                  border: InputBorder.none,
                  focusColor: Colors.black,
                ),
              ),
            ),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
