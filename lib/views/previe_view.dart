import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import '../constants.dart';
import '../helper/store_fav.dart';
import '../models/picture_cat_model.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/image_cards_builder.dart';

class PrevieView extends StatelessWidget {
  PrevieView({
    super.key,
    required this.image,
  });
  static String id = 'Previeview';
  final PicCat image;

  @override
  Widget build(BuildContext context) {
    final List<String> type = image.type.split(',');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(kPrimaryAppName),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kPrimaryPadding),
                        child: Image.network(
                          image.image,
                        ),
                      ),
                    ),
                    Positioned(
                        child: IconButton(
                      onPressed: () async {
                       
                        try {
                          // Saved with this method.
                          var imageId =
                              await ImageDownloader.downloadImage(image.image);
                          print("return");
                          if (imageId == null) {
                            return;
                          }
                          // Below is a method of obtaining saved image information.
                          // var fileName =
                          //     await ImageDownloader.findName(imageId);
                          // var path = await ImageDownloader.findPath(imageId);
                          // var size =
                          //     await ImageDownloader.findByteSize(imageId);
                          // var mimeType =
                          //     await ImageDownloader.findMimeType(imageId);
                          // print("done $path");
                        } catch (error) {
                          debugPrint('$error');
                        }
                      },
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      color: Colors.white,
                    ))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "more similar photos",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Store().storeFav(image);
                          // print(Store().getFav().first);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red[700],
                        ))
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: ImagesBuilder(type: type.first)),
          ],
        ),
      ),
    );
  }
}
