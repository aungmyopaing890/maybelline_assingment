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
  List? productColors;

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
    productColors = json['product_colors'];
  }
}
