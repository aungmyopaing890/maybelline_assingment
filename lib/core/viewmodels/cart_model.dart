import 'package:maybelline/core/models/cart.dart';
import 'package:maybelline/core/models/product.dart';
import 'package:maybelline/core/services/product_service.dart';
import 'package:maybelline/core/viewmodels/base_model.dart';
import 'package:maybelline/locator.dart';

class CartModel extends BaseModel {
  final ProductService _productService = locator<ProductService>();

  void add(Product product) {
    _productService.add(product);
    notifyListeners();
  }

  void minus(Product product) {
    _productService.minus(product);
    notifyListeners();
  }
}
