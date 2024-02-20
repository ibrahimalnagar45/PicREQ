import 'package:flutter/material.dart';

import '../constants.dart'; 
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.label = "",
    required this.onpressed,
    this.leftPadding = kPrimaryPadding * 4,
    this.rightPadding = kPrimaryPadding * 4,
    this.topPadding = kPrimaryPadding * 2,
    this.width = 30,
    this.color = kPrimaryColor,
    this.icon = "",
  });
  final String label;
  final String icon;
  final VoidCallback onpressed;
  final double leftPadding;
  final double rightPadding;
  final double width;
  final double topPadding;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: topPadding),
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(kPrimaryPadding)),
      child: IconButton(
          onPressed: onpressed,
          icon: label != ""
              ? Text(
                  label,
                  style: TextStyle(fontSize: kPimaryFontSize),
                )
              : ImageIcon(AssetImage(icon))),
    );
  }
}
