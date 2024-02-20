import 'package:flutter/material.dart';

import '../constants.dart';
import '../helper/store_fav.dart';
import '../models/picture_cat_model.dart';
import '../views/previe_view.dart';
import 'drop_down_menue.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.image,
    this.status = 'add',
  });
  final String status;
  final PicCat image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PrevieView(
            image: image,
          );
        }));
      },
      child: Expanded(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kPrimaryPadding / 2),
              child: Image.network(
                image.image,
                // height: image.length.toDouble() * 10,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  status == 'add'
                      ? Store().storeFav(image)
                      : Store().delFav(image);
                },
                icon: status == 'add'
                    ? IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DropDownMenue();
                          }));
                        },
                      )
                    : const Icon(Icons.heart_broken),
                color: Colors.red.withOpacity(.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
