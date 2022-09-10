import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:maybelline/core/models/product.dart';

/// The service responsible for networking requests
class Api {
  static const endpoint =
      'http://makeup-api.herokuapp.com/api/v1/products.json';

  var client = http.Client();

  Future<List<Product>> fetchProducts() async {
    List<Product> pruducts = [];

    // Get maybelline products from api
    var response = await client.get(Uri.parse('$endpoint?brand=maybelline'));

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var pruduct in parsed) {
      pruducts.add(Product.fromJson(pruduct));
    }

    return pruducts;
  }
}
