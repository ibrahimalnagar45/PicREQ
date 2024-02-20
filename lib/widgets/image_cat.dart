import 'package:flutter/material.dart';

import '../constants.dart'; 

class ImageCat extends StatelessWidget {
  const ImageCat({super.key, required this.image // required this.pic
      });
  final String image;
  // final PicCat pic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPrimaryPadding),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
          height: 200,
        ),
      ),
    );
  }
}
