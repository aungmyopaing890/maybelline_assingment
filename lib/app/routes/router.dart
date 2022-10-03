import 'package:flutter/material.dart';
import 'package:maybelline/app/pages/home/home_view.dart';
import 'package:maybelline/app/pages/productDetails/product_detail_view.dart';
import 'package:maybelline/app/pages/report/report_view.dart';

class Routes {
  static const String productDetailRoute = "/productDetail";
  static const String homeRoute = "/home";
  static const String report = "/report";
}

final Map<String, WidgetBuilder> routes = {
  Routes.homeRoute: (context) => const HomeView(),
  Routes.productDetailRoute: (context) => const ProductDetailView(),
  Routes.report: (context) => const ReportView(),
};
