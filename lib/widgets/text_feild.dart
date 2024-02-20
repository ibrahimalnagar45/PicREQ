import 'package:flutter/material.dart';

import '../constants.dart'; 

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      required this.onchanged,
      required this.validator,
      required this.icon,
      this.hinttext = ""});
  final String label, hinttext;

  final Function(String) onchanged;
  final String? Function(String?) validator;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kPrimaryPadding / 2,
          right: kPrimaryPadding / 2,
          bottom: kPrimaryPadding),
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: kPrimaryPadding / 2),
        padding: const EdgeInsets.only(
          left: kPimaryFontSize / 2,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffeef1f6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Expanded(
          child: TextFormField(
            validator: validator,
            decoration: InputDecoration(
                focusColor: Colors.transparent,
                label: Text(
                  label,
                  style: TextStyle(color: Colors.black),
                ),
                hintText: hinttext,
                hintStyle: const TextStyle(fontSize: kPimaryFontSize),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                // focusedBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                )),
            onChanged: onchanged,
          ),
        ),
      ),
    );
  }
}
