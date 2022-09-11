import 'package:flutter/cupertino.dart';

class Product {
  int? id;
  String? brand;
  String? name;
  double? price;
  String? priceSign;
  String? imageLink;
  String? description;
  double? rating;
  String? productType;
  List<ProductColor>? productColors = [];

  Product(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.priceSign,
      required this.imageLink,
      required this.description,
      this.rating,
      required this.productType,
      this.productColors});

  Product.initial()
      : id = 0,
        brand = '',
        name = '',
        price = 0.0,
        rating = 0.0,
        imageLink = '',
        description = '',
        productType = '';

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    rating = json['rating'];
    price = double.parse(json['price']);
    priceSign = json['price_sign'];
    imageLink = json['image_link'];
    description = json['description'];
    productType = json['product_type'];
    for (var pruduct in json['product_colors']) {
      productColors?.add(ProductColor.fromJson(pruduct));
    }
  }
}

class ProductColor {
  Color? color;

  ProductColor({
    this.color,
  });

  ProductColor.fromJson(Map<String, dynamic> json) {
    color = HexColor.fromHex(json['hex_value']);
  }
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
