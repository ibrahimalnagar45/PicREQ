class PicCat {
  final String image;
  final int length;
  final String type;
  PicCat({
    required this.type,
    required this.length,
    required this.image,
  });

  factory PicCat.fromJosn(
      {required String image, required int length, required String type}) {
    return PicCat(
      type: type,
      image: image,
      length: length,
    );
  }
}
