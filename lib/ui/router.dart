import 'package:flutter/material.dart';
import 'package:maybelline/ui/Views/home/home_view.dart';
import 'package:maybelline/ui/Views/productDetails/product_detail_view.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/productDetail':
        return MaterialPageRoute(builder: (_) => const ProductDetailView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
