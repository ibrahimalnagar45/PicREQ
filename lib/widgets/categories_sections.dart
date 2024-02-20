import 'package:flutter/material.dart';

import '../constants.dart'; 
class CategoreisSection extends StatelessWidget {
  const CategoreisSection({super.key, required this.cat});
  final String cat;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 200, bottom: 10),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      height: 25,
      decoration: BoxDecoration(
          boxShadow: List.filled(
              1,
              const BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 167, 184, 196),
                blurRadius: 8,
              ),
              growable: true),
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(kPrimaryPadding)),
      child: Text(
       cat,
        style: TextStyle(
          fontSize: kPimaryFontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(.5),
        ),
      ),
    );
  }
}
