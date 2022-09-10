import 'package:flutter/widgets.dart';
import 'package:maybelline/ui/Views/home/home_view.dart';
import 'package:maybelline/ui/Views/productDetails/product_detail_view.dart';
import 'Views/report/report_view.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomeView(),
  '/productDetail': (context) => const ProductDetailView(),
  '/report': (context) => const ReportView(),
};
