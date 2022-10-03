// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:maybelline/app/data/services/api.dart';
import 'package:maybelline/app/data/services/cart_service.dart';
import 'package:maybelline/app/data/services/order_service.dart';
import 'package:maybelline/app/data/services/product_service.dart';
import 'package:maybelline/app/data/viewmodels/cart_model.dart';
import 'package:maybelline/app/data/viewmodels/home_model.dart';
import 'package:maybelline/app/data/viewmodels/order_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => CartModel());
  locator.registerFactory(() => OrderService());
  locator.registerFactory(() => OrderModel());
  locator.registerFactory(() => HomeModel());
}
