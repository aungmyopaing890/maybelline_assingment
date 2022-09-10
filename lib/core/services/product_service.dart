import 'package:maybelline/core/models/product.dart';
import 'package:maybelline/core/services/api.dart';
import 'package:maybelline/locator.dart';

class ProductService {
  final Api _api = locator<Api>();

  late List<Product> _products;
  List<Product> get products => _products;

  Future fetchProducts() async {
    _products = await _api.fetchProducts();
  }
}
