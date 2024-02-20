import 'dart:convert';
import 'package:http/http.dart' as http; 

import '../constants.dart';
import '../models/picture_cat_model.dart';

class GetPictures {
  final String type;
  List<PicCat> urls = [];

  GetPictures({this.type = 'general'});

  Future<List<PicCat>> getPciture() async {
    String url = "$baseUrl?key=$kPrimaryApiKey&q=$type";
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print(" the dataaaaaaaaaaavvvv is $data");

        if (data['totalHits'] != null) {
          for (var hint in data['hits']) {
            // pictures.add(PicCat.fromJosn(response.headers));
            urls.add(PicCat.fromJosn(
              image: hint['webformatURL'],
              length: hint['imageHeight'],
              type: hint['tags'],
            ));
          }
          print("the imageeeeeeeee" + url[0]);
          return urls;
        } else {
          throw Exception('Unexpected response format from Pixabay API');
        }
      } else {
        throw Exception('failed to load image');
      }
    } catch (e) {
      print("this is the eeerroor" + e.toString());

      throw Exception(e.toString());
    }
  }
}
