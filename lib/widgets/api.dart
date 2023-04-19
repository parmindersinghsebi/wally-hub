import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallyhub/modals/photosmodal.dart';

class Apioperation {
  static gettrending() async {
    late List<PhotosModal> trendingwall = [];
    await http.get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {
      "Authorization":
          "71iCjV74EP2zL8EvWvGkLW9XZoQboxQo6uhgaeW3cWhZgxGiNfFDgcdb"
    }).then((value) {
      Map<String, dynamic> data = jsonDecode(value.body);
      List pics = data['photos'];
      pics.forEach((element) {
        trendingwall.add(PhotosModal.fromapp(element));
      });
    });
    return trendingwall;
  }

  static searchwall(String query) async {
    late List<PhotosModal> searchwall = [];
    await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=$query&per_page=30&page=1'),
        headers: {
          "Authorization":
              "71iCjV74EP2zL8EvWvGkLW9XZoQboxQo6uhgaeW3cWhZgxGiNfFDgcdb"
        }).then((value) {
      Map<String, dynamic> data = jsonDecode(value.body);
      List pics = data['photos'];
      searchwall.clear();
      pics.forEach((element) {
        searchwall.add(PhotosModal.fromapp(element));
      });
    });
    return searchwall;
  }
}
