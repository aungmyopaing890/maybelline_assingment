import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maybelline/core/models/product.dart';

class Api {
  static const endpoint =
      'http://makeup-api.herokuapp.com/api/v1/products.json';

  var client = http.Client();

  Future<List<Product>> fetchProducts() async {
    List<Product> pruducts = [];
    var response = await client.get(Uri.parse('$endpoint?brand=maybelline'));
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var pruduct in parsed) {
      pruducts.add(Product.fromJson(pruduct));
    }

    return pruducts;
  }

  Future<Product> getProduct(int productId) async {
    var response =
        await client.get(Uri.parse('$endpoint/products/$productId.json'));
    var parsed = json.decode(response.body);
    return Product.fromJson(parsed);
  }
}
