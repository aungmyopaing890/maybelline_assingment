import 'package:flutter/material.dart';
import 'package:maybelline/app/data/models/product.dart';
import 'package:maybelline/app/pages/productDetails/product_detail_view.dart';
import 'package:maybelline/app/pages/widgets/responsive.dart';
import 'package:maybelline/app/ui/app_colors.dart';

class CardWidget extends StatelessWidget {
  final Product product;
  const CardWidget(this.product, {Key? key}) : super(key: key);
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
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: Responsive.isMobile(context) ? 150 : 350,
          height: Responsive.isMobile(context) ? 150 : 400,
          child: Card(
            color: cardColor,
            elevation: 20,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.network(
                          product.imageLink.toString(),
                          width: Responsive.isMobile(context) ? 100 : 350,
                          height: Responsive.isMobile(context) ? 150 : 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.favorite,
                            size: Responsive.isMobile(context) ? 30 : 32,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      product.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: titleColor,
                          fontSize: Responsive.isMobile(context) ? 18 : 20),
                    )),
                Text(
                  product.productType.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: Responsive.isMobile(context) ? 16 : 18),
                ),
                Text(
                  '${product.priceSign ?? r"$"} ${product.price}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.isMobile(context) ? 20 : 22),
                )
              ],
            ),
          ),
        ));
  }
}
