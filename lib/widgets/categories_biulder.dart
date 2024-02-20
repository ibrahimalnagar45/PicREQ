import 'package:flutter/material.dart';

import 'image_cat.dart'; 

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});
  final List<String> images = const [
    'assets/pictures/sakani logo.jpg',
    'assets/pictures/File Format Vector Design Images, Log File Format Icon Design, File Icons, Format Icons, Log File Format Icon PNG Image For Free Download.jpeg',
    'assets/pictures/File Format Vector Design Images, Log File Format Icon Design, File Icons, Format Icons, Log File Format Icon PNG Image For Free Download.jpeg',
    'assets/pictures/Language free vector icons designed by Freepik.jpeg',
    'assets/pictures/Modern Building Logo (1).png',
    'assets/pictures/sakani logo.jpg',
    'assets/pictures/File Format Vector Design Images, Log File Format Icon Design, File Icons, Format Icons, Log File Format Icon PNG Image For Free Download.jpeg',
    'assets/pictures/File Format Vector Design Images, Log File Format Icon Design, File Icons, Format Icons, Log File Format Icon PNG Image For Free Download.jpeg',
    'assets/pictures/Language free vector icons designed by Freepik.jpeg',
    'assets/pictures/Modern Building Logo (1).png',
    'assets/pictures/sakani logo.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ImageCat(image: images[index]);
            }),
      ),
    );
  }
}
