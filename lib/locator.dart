// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:maybelline/core/services/api.dart';
import 'package:maybelline/core/services/product_service.dart';
import 'package:maybelline/core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => Api());
  locator.registerFactory(() => HomeModel());
}
