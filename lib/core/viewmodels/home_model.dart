import 'package:maybelline/core/enum/viewstate.dart';
import 'package:maybelline/core/models/product.dart';
import 'package:maybelline/core/services/product_service.dart';
import 'package:maybelline/core/viewmodels/base_model.dart';
import 'package:maybelline/locator.dart';

class HomeModel extends BaseModel {
  final ProductService _productService = locator<ProductService>();

  List<Product> get posts => _productService.products;

  Future fetchProducts() async {
    setState(ViewState.Busy);
    await _productService.fetchProducts();
    setState(ViewState.Idle);
  }
}
