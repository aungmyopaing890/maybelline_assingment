import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/data/services/api.dart';
import 'package:maybelline/app/locator.dart';

class ProductService {
  final Api _api = locator<Api>();

  late List<Product> _products;
  List<Product> get products => _products;

  Future fetchProducts() async {
    _products = await _api.fetchProducts();
  }

  void minus(Product product) {
    final index = _products.indexWhere((e) => e.id == product.id);
    if (_products[index].quantity != 1) {
      _products[index].quantity -= 1;
      _products[index].total =
          (_products[index].price * _products[index].quantity);
    }
  }

  void add(Product product) {
    final index = _products.indexWhere((e) => e.id == product.id);
    _products[index].quantity += 1;
    _products[index].total = _products[index].price * _products[index].quantity;
  }
}
