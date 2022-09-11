import 'package:flutter/material.dart';
import 'package:maybelline/core/viewmodels/cart_model.dart';
import 'package:maybelline/core/viewmodels/home_model.dart';
import 'package:maybelline/locator.dart';
import 'package:maybelline/ui/routes.dart';
import 'package:maybelline/ui/shared/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeModel>(
            create: (BuildContext context) => HomeModel(),
          ),
          ChangeNotifierProvider<CartModel>(
            create: (BuildContext context) => CartModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Maybeline',
          theme: ThemeData(
              brightness: Brightness.light, primaryColor: primaryColor),
          initialRoute: '/',
          routes: routes,
        ));
  }
}
