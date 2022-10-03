import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/pages/productDetails/product_detail_view.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
import 'package:maybelline/app/ui/app_colors.dart';

class CardWidget extends StatelessWidget {
  final Product product;
  const CardWidget(this.product, {Key? key}) : super(key: key);

  final double borderRadius = 20;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/productDetail',
            arguments: ProductDetailsArguments(product: product),
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: Responsive.isMobile(context) ? 170 : 355,
          height: Responsive.isMobile(context) ? 200 : 380,
          child: Card(
            color: cardColor,
            elevation: 20,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 15, left: 5, right: 5),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(borderRadius),
                            topRight: Radius.circular(borderRadius)),
                        child: Image.network(
                          product.imageLink.toString(),
                          width: Responsive.isMobile(context) ? 170 : 355,
                          height: Responsive.isMobile(context) ? 150 : 380,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(
                              Responsive.isMobile(context) ? 5 : 30.0),
                          child: Icon(
                            Icons.favorite,
                            size: Responsive.isMobile(context) ? 26 : 32,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Responsive.isMobile(context) ? 5 : 10,
                        horizontal: 15),
                    alignment: Alignment.center,
                    child: Text(
                      product.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.isMobile(context) ? 16 : 22),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Responsive.isMobile(context) ? 5 : 10,
                      horizontal: Responsive.isMobile(context) ? 10 : 20),
                  child: Text(
                    product.productType.toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: Responsive.isMobile(context) ? 16 : 22),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: Responsive.isMobile(context) ? 5 : 10,
                      horizontal: Responsive.isMobile(context) ? 10 : 20),
                  child: Text(
                    '${product.priceSign ?? r"$"} ${product.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.isMobile(context) ? 18 : 26),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
