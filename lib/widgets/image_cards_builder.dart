import 'package:flutter/material.dart'; 
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/picture_cat_model.dart';
import '../services/getting_pics.dart';
import 'image_card.dart';

class ImagesBuilder extends StatefulWidget {
  const ImagesBuilder({super.key, required this.type});
  final String type;
  @override
  State<ImagesBuilder> createState() => _ImagesBuilderState();
}

class _ImagesBuilderState extends State<ImagesBuilder> {
  bool isloading = true;
  List<PicCat> pictuers = [];

  @override
  void initState() {
    super.initState();

    getdata();
  }

  Future<void> getdata() async {
    try {
      List<PicCat> url = await GetPictures(type: widget.type).getPciture();
      setState(() {
        pictuers = url;
        isloading = false;
      });
    } catch (e) {
      throw (e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? const Center(child: CircularProgressIndicator())
        : pictuers.isEmpty
            ? const Text("error")
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: MasonryGridView.count(
                    physics:const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: pictuers.length,
                    itemBuilder: (context, index) {
                      return ImageCard(
                        image: pictuers[index],
                      );
                    },
                  ),
                ));
  }
}
