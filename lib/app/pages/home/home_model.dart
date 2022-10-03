import 'package:maybelline/app/data/enum/viewstate.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/data/services/product_service.dart';
import 'package:maybelline/app/data/viewmodels/base_model.dart';
import 'package:maybelline/app/locator.dart';

class HomeModel extends BaseModel {
  final ProductService _productService = locator<ProductService>();

  List<Product> get products => _productService.products;

  Future fetchProducts() async {
    setState(ViewState.Busy);
    await _productService.fetchProducts();
    setState(ViewState.Idle);
  }
}
