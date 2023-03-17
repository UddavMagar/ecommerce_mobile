import 'dart:convert';

import 'package:ecommerce_mobileapp/models/gallery.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class GalleryNetworkHandler {
  Future<dynamic> requestToServer(String url) async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(url));
      List<Gallery> galleryList = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        for (Map<String, dynamic> i in data) {
          galleryList.add(Gallery.fromJson(i));
        }
        
        return galleryList;
      } else {
        return galleryList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
