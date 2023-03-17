import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/product.dart';

class NetworkHandler {
  Future<dynamic> requestToServer(String url) async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(url));
      List<Product> productList = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        for (Map<String, dynamic> i in data) {
          productList.add(Product.fromJson(i));
        }
        
        return productList;
      } else {
        return productList;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
