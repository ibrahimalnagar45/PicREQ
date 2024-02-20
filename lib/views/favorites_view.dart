import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart'; 
import 'package:flutter/material.dart';
import '../helper/store_fav.dart';
import '../models/picture_cat_model.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/image_card.dart';
import '../constants.dart';

class FavortiesView extends StatelessWidget {
  FavortiesView({
    super.key,
  });
  final List<PicCat> favorites = Store().getFav();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(kPrimaryAppName),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomDrawer(),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/pictures/R.png",
                    scale: 10,
                  ),
                  const SizedBox(
                    height: kPrimaryPadding,
                  ),
                  const Text(
                    "no favories images yet ",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    ImageCard(
                      status: 'del',
                      image: favorites[index],
                    ),
                  ]);
                },
              ),
            ),
    );
  }
}
