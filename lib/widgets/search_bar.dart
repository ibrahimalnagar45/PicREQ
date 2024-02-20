import 'package:flutter/material.dart';

import '../constants.dart';

class Searchfeild extends StatelessWidget {
  const Searchfeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kPrimaryPadding / 4, bottom: kPrimaryPadding),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(kPrimaryPadding)),
      child: TextField(
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
