 

import '../models/picture_cat_model.dart';

class Store {
  static List<PicCat> favorites = [];
  void storeFav(PicCat image) {
    if (favorites.contains(image)) {
      return;
    } else {
      favorites.add(image);
    }
  }

  void delFav(PicCat image) {
    favorites.remove(image);
  }

  List<PicCat> getFav() {
    return favorites;
  }
}
